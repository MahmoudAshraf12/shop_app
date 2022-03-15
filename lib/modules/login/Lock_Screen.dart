import 'package:flutter/material.dart';

import '../../shared/shared_components/components.dart';

class LoginScreen extends StatelessWidget {
    var EmailController= TextEditingController();
    var passwordController= TextEditingController();
    final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w800,

                  ),

                ),
                SizedBox(height: 20.0),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formkey,
                  child: TextFormField(
                   controller:EmailController ,
                    onFieldSubmitted: (value)
                    {
                      print(value);

                    },
                   validator: (String ?value){
                     if(value!.isEmpty){
                       print('خخخخخخخخخخخخخ متدخله');
                     }else{
                       return null;
                     }
                   },
                    keyboardType:TextInputType.emailAddress,
                    decoration: InputDecoration(
                     labelText: 'Email Address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email ,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: passwordController,
                  onFieldSubmitted: (value)
                  {
                    print(value);

                  },
                  validator: (value){
                    if(value== null){
                      print('لازم تدخله يغبى');
                    }
                  },
                  keyboardType:TextInputType.visiblePassword ,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock ,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    ),

                  ),
                ),
                SizedBox(height: 15.0),
                defaultButton(
                  text: 'login',
                  width: double.infinity,
                  background: Colors.blue,
                  function: (){
                    final isvalid= formkey.currentState !. validate();
                      if(isvalid){
                        print(EmailController.text);
                        print(passwordController.text);
                      }
                    }
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an acount?',
                    ),
                    TextButton(onPressed: (){}, child: Text(
                      'Register',
                    ),)
                  ],
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
