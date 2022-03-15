import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/modules/counter/cubic/cubit.dart';
import 'package:udemy/modules/counter/cubic/states.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer< CounterCubit, CounterStates>(
       listener:(context, state){
         if(state is CounterMinusState){

         }
         if(state is CounterPlusState){

         }
       } ,
        builder:(context, state){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'Counter'
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed:(){
                     CounterCubit.get(context).Minus();
                  } ,
                      child: Text(
                        'Minus',
                        ),
                      ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(onPressed:(){
                    CounterCubit.get(context).Plus();
                  } ,
                    child: Text(
                      'Plus',
                    ),
                  ),
                ],

              ),
            ),
          );
        } ,

      ),
    );
  }
}
