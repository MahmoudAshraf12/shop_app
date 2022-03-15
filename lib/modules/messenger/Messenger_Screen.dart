import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/99623614?s=400&u=1cb73b3dee75227c88d62588ce06f72ef57bed77&v=4'),
              backgroundColor: Colors.black26,
            ),
            SizedBox(width: 20.0),
            Text(
              'Chats',
              style: TextStyle(
               fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed:(){},
              icon: CircleAvatar(
                backgroundColor: Colors.black45,
                radius: 15.0,
                child: Icon(
                  Icons.camera_alt,
                  size: 23.0,
                  color: Colors.white,
                ),
              ),
          ),
          IconButton(onPressed:(){},
            icon: CircleAvatar(
              backgroundColor: Colors.black45,
              radius: 15.0,
              child: Icon(
                Icons.edit,
                size: 23.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    17.0,
                  ),
                  color: Colors.grey,
                ),
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 15.0),
                    Text(
                        'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0,),
            ],
          ),
        ),
      ),
    );
  }
}
