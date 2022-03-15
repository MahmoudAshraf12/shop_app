
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy/layout/shop_app/shop_layout.dart';
import 'package:udemy/modules/shop_app/register/shop_register_screen.dart';
import 'package:udemy/modules/shop_app/shop_login_screen/cubit/cubit.dart';
import 'package:udemy/modules/shop_app/shop_login_screen/cubit/states.dart';
import 'package:udemy/shared/network/local/shared_preferences.dart';
import 'package:udemy/shared/shared_components/components.dart';

class ShopLoginScreen extends StatelessWidget {
 var formkey= GlobalKey<FormState>();
 var emailController= TextEditingController();
 var passwardController= TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state)
        {
          if(state is ShopLoginSuccessStates){
            if(state.loginModel.status!){
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
                navicateAndFinished(context, ShopLayout());
            }else{
                 print(state.loginModel.message);
                  ShowToast(
                  text: state.loginModel.message!,
                  state:ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          'Login now to browse our hot offers',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          controller:emailController ,
                          keyboardType: TextInputType.text ,
                          validator: (String ? value)
                          {
                            if(value!.isEmpty){
                              return 'Please enter your email address';
                            }
                          } ,
                          decoration:InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: 'Email address',
                            border: OutlineInputBorder(),
                          ) ,
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller:passwardController ,
                          keyboardType: TextInputType.visiblePassword ,
                          onFieldSubmitted: (value)
                          {
                            if(formkey.currentState!.validate()){
                              ShopLoginCubit.get(context).userlogin(
                                email: emailController.text,
                                password: passwardController.text,

                              );
                            }
                          },
                          validator: (String ? value)
                          {
                            if(value!.isEmpty){
                              return 'Please enter your passward';
                            }
                          } ,
                          obscureText: ShopLoginCubit.get(context).IsObsecure,
                          decoration:InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            labelText: 'Passward',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(ShopLoginCubit.get(context).suffix),
                              onPressed: ()
                              {
                                ShopLoginCubit.get(context).ChangePasswordVisibility();
                              },
                            ),
                          ) ,
                        ),
                        SizedBox(height: 30,),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingStates,
                          builder: (context) =>defaultButton(
                            width: double.infinity,
                            background: Colors.deepOrange,
                            function: ()
                            {
                              if(formkey.currentState!.validate()){
                                ShopLoginCubit.get(context).userlogin(
                                  email: emailController.text,
                                  password: passwardController.text,
                                );
                              }

                            },
                            text: 'LOGIN',
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Text(
                                'Don\'t have an acount?'
                            ),
                            TextButton(onPressed: ()
                            {
                              navicateTo(context, ShopRegisterScreen());
                            },
                              child: Text('Register'),)
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
