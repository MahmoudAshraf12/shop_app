import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/modules/shop_app/register/cubit/cubit.dart';
import 'package:udemy/modules/shop_app/register/cubit/states.dart';
import 'package:udemy/shared/network/local/shared_preferences.dart';

import '../../../layout/shop_app/shop_layout.dart';
import '../../../shared/shared_components/components.dart';
import '../../../shared/shared_components/constants.dart';
import '../shop_login_screen/cubit/cubit.dart';
import '../shop_login_screen/cubit/states.dart';

class ShopRegisterScreen extends StatelessWidget {
  var formkey= GlobalKey<FormState>();
  var emailController= TextEditingController();
  var passwardController= TextEditingController();
  var nameController= TextEditingController();
  var phoneController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state)
        {
          if(state is ShopRegisterSuccessStates){
            if(state.loginModel.status!){
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
              CacheHelper.SaveData(key: 'token', value: state.loginModel.data!.token).then((value)
              {
                token = state.loginModel.data!.token! ;
                navicateAndFinished(context, ShopLayout());
              });

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
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          'Register now to browse our hot offers',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          controller:nameController ,
                          keyboardType: TextInputType.name ,
                          validator: (String ? value)
                          {
                            if(value!.isEmpty){
                              return 'Please enter your name';
                            }
                          } ,
                          decoration:InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'User Name',
                            border: OutlineInputBorder(),
                          ) ,
                        ),
                        SizedBox(height: 15.0,),
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
                          // onFieldSubmitted: (value)
                          // {
                          //   if(formkey.currentState!.validate()){
                          //     ShopLoginCubit.get(context).userlogin(
                          //       email: emailController.text,
                          //       password: passwardController.text,
                          //
                          //     );
                          //   }
                          // },
                          validator: (String ? value)
                          {
                            if(value!.isEmpty){
                              return 'Please enter your passward';
                            }
                          } ,
                          obscureText: ShopRegisterCubit.get(context).IsObsecure,
                          decoration:InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            labelText: 'Passward',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(ShopRegisterCubit.get(context).suffix),
                              onPressed: ()
                              {
                                ShopRegisterCubit.get(context).ChangePasswordVisibility();
                              },
                            ),
                          ) ,
                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          controller:phoneController ,
                          keyboardType: TextInputType.phone ,
                          validator: (String ? value)
                          {
                            if(value!.isEmpty){
                              return 'Please enter your phone number ';
                            }
                          } ,
                          decoration:InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: 'phone number',
                            border: OutlineInputBorder(),
                          ) ,
                        ),
                        SizedBox(height: 20.0,),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingStates,
                          //state is! ShopLoginLoadingStates,
                          builder: (context) =>defaultButton(
                            width: double.infinity,
                            background: Colors.deepOrange,
                            function: ()
                            {
                              if(formkey.currentState!.validate()){
                                ShopRegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwardController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                              }

                            },
                            text: 'register',
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
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
