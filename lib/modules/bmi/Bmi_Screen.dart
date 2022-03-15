import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy/modules/bmi_result/BMI_Result_Screen.dart';

class BmiScreen extends StatefulWidget {

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale= true;
  double height= 180.0;
  int weight= 60;
  int Age= 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text(
          'Bmi Calculator',
        ),
          ),
body: Column(
    children: [
      Expanded(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale= true;
                      });
                    },
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale ? Colors.blue : Colors.white38,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 70.0,
                              color: Colors.white,
                            ),
                            SizedBox(height: 10.0,),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale= false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: !isMale ? Colors.blue : Colors.white38,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 70.0,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10.0,),
                          Text(
                            'Female',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
      Expanded(
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white38,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  'HIGHT',
                  style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                  ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Text(
                        '${height.round()}',
                        style: TextStyle(
                          fontSize: 45.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        'CM',
                        style: TextStyle(
                          fontSize: 23.0,
                          color: Colors.white60,
                      ),
                      ),
                    ],
                  ),
                  Slider(value: height,
                      min: 80.0,
                      max: 220.0,
                      onChanged:(value){
                    setState(() {
                      height=value;
                    });
                      } ),
                ],
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                   Expanded(
                     child: Container(
                     decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0),
                     color: Colors.white38,
                     ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             'WEIGHT',
                             style: TextStyle(
                               fontSize: 28.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.white60,
                             ),
                           ),
                           Text(
                             '${weight}',
                             style: TextStyle(
                               fontSize: 36.0,
                               color: Colors.white,
                               fontWeight: FontWeight.w900,
                             ),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(onPressed: (){
                                 setState(() {
                                   weight--;
                                 });
                               },
                                 heroTag: 'Weight-',
                                 mini: true,
                               child: Icon(
                                 Icons.remove,
                               ),
                               ),
                               FloatingActionButton(onPressed: (){
                                 setState(() {
                                   weight++;
                                 });
                               },
                                 heroTag: 'Weight+',
                                 mini: true,
                               child: Icon(
                                 Icons.add,
                               ),
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                   SizedBox(width: 15.0,),
                   Expanded(
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.0),
                         color: Colors.white38,
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             'AGE',
                             style: TextStyle(
                               fontSize: 28.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.white60,
                             ),
                           ),
                           Text(
                             '${Age}',
                             style: TextStyle(
                               fontSize: 36.0,
                               color: Colors.white,
                               fontWeight: FontWeight.w900,
                             ),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(onPressed: (){
                                 setState(() {
                                   Age--;
                                 });
                               },
                                 heroTag: 'Age-',
                                 mini: true,
                               child: Icon(
                                 Icons.remove,
                               ),
                               ),
                               FloatingActionButton(onPressed: (){
                                 setState(() {
                                   Age++;
                                 });
                               },
                                 heroTag: 'Age+',
                                 mini: true,
                               child: Icon(
                                 Icons.add,
                               ),
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
              ],
            ),
          ),
        ),
      ),
      Container(
        height: 70.0,
        width: double.infinity,
        color: Colors.red,
        child: MaterialButton(
            onPressed: (){
              double result = weight / pow(height/100,2);
              print(result.round());

              Navigator.push(context,
                  MaterialPageRoute(builder:(context) => BMIResultScreen(
                    Age: Age,
                    result: result.round(),
                    isMale: isMale,
                  ) ,
                  ),);
            },
           child: Text(
             'Calculate',
             style: TextStyle(
               color: Colors.white,
             ),
           ),
        ),
      ),

    ],
 ),

    );
  }
}
