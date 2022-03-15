import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: Icon(
         Icons.menu,
       ),
       title: Text(
         'First App'
       ),
       actions: [
        IconButton(onPressed: (){
          print('hhhh');
        },
        icon:  Icon(
          Icons.notification_important,
        ),)

       ],
       centerTitle: true,
     ),
     body:Column(
       children: [
         Container(
           width: 300.0,
           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadiusDirectional.only(
                 topEnd: Radius.circular(20.0),
                 bottomEnd: Radius.circular(20.0),
               ),
             ),
             clipBehavior: Clip.antiAliasWithSaveLayer,    // عشان أقصه واعمله حواف
             child: Stack(
               alignment: Alignment.bottomLeft,

               children: [
                 Image(
                   image:NetworkImage(
                   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCXkS0q2J3NQcThK_cPilyJzsL73oHzjhhlQ&usqp=CAU',
                 ),
                   fit: BoxFit.cover ,
                   //height: 200.0,
                   width: 300.0,
                   //fit:BoxFit.cover


                 ),
                 Container(
                   width:double.infinity ,
                   color: Colors.black.withOpacity(.9),
                   padding: EdgeInsetsDirectional.only(
                     top: 5.0,
                     bottom: 5.0,

                   ),
                   child: Text(
                     'Flower',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 20.0,
                       color: Colors.white,
                       backgroundColor: Colors.black,
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
     
   );
  }

}