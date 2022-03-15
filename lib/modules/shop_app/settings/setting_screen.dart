import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/shop_app/cubit/cubit.dart';
import 'package:udemy/modules/shop_app/shop_login_screen/shop_login_screen.dart';
import 'package:udemy/shared/shared_components/components.dart';

import '../../../layout/shop_app/cubit/states.dart';

class Settingscreen extends StatelessWidget {
  var formKey= GlobalKey<FormState>();
var nameController= TextEditingController();
var emailController= TextEditingController();
var phoneController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state)
      {
        if(state is ShopSuccessUserDataState){
          nameController.text = state.loginModel.data!.name!;
          emailController.text = state.loginModel.data!.email!;
          phoneController.text = state.loginModel.data!.phone!;
        }
      },
      builder: (context, state)
      {
        var model= ShopCubit.get(context).userModel;
        nameController.text= model!.data!.name!;
        emailController.text= model.data!.email!;
        phoneController.text= model.data!.phone!;
        return  ConditionalBuilder(
          condition: ShopCubit.get(context).userModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children:
                [
                  if(state is ShopLoadingUpdateUserState)
                  LinearProgressIndicator(),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    controller: nameController ,
                    keyboardType: TextInputType.text ,
                    validator: (String ? value)
                    {
                      if(value!.isEmpty){
                        return 'name must not be empty';
                      }
                    } ,
                    decoration:InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ) ,
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    controller: emailController ,
                    keyboardType: TextInputType.emailAddress ,
                    validator: (String ? value)
                    {
                      if(value!.isEmpty){
                        return 'email must not be empty';
                      }
                    } ,
                    decoration:InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                    ) ,
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    controller: phoneController ,
                    keyboardType: TextInputType.phone ,
                    validator: (String ? value)
                    {
                      if(value!.isEmpty){
                        return 'phone must not be empty';
                      }
                    } ,
                    decoration:InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'phone',
                      border: OutlineInputBorder(),
                    ) ,
                  ),
                  SizedBox(height: 20.0,),
                  defaultButton(
                    width: double.infinity,
                    background: Colors.deepOrange,
                    function: ()
                    {
                      if(formKey.currentState!.validate()){
                        ShopCubit.get(context).UpdateUserData(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        );
                      }
                    },
                    text: 'UPDATA',
                  ),
                  SizedBox(height: 18.0,),
                  defaultButton(
                      width: double.infinity,
                      background: Colors.deepOrange,
                      function: ()
                      {
                        navicateAndFinished(context, ShopLoginScreen());
                      },
                      text: 'LOGOUT',
                  ),
                ],
              ),
            ),
          ),
          fallback:(context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
