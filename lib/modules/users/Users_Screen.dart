import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class UserModel {
  final int id;
  final String name;
  final String phone;
UserModel({
  required this.id,
  required this.name,
  required this.phone,
});
}

class UsersScreen extends StatelessWidget {
List<UserModel> Users=[
  UserModel(id: 1, name: 'Mahmoud Ashraf', phone: '01146775216'),
  UserModel(id: 2, name: 'Abdallah Ahmed', phone: '01256554565'),
  UserModel(id: 3, name: 'Mohamed Ashraf', phone: '01565966664'),
  UserModel(id: 4, name: 'Mahmoud Ashraf', phone: '01146775216'),
  UserModel(id: 5, name: 'Abdallah Ahmed', phone: '01256554565'),
  UserModel(id: 6, name: 'Mohamed Ashraf', phone: '01565966664'),
  UserModel(id: 7, name: 'Mahmoud Ashraf', phone: '01146775216'),
  UserModel(id: 8, name: 'Abdallah Ahmed', phone: '01256554565'),
  UserModel(id: 9, name: 'Abdallah Ahmed', phone: '01256554565'),
  UserModel(id: 10, name: 'Mohamed Ashraf', phone: '01565966664'),
  UserModel(id: 11, name: 'Mahmoud Ashraf', phone: '01146775216'),
  UserModel(id: 12, name: 'Abdallah Ahmed', phone: '01256554565'),
  UserModel(id: 13, name: 'Mohamed Ashraf', phone: '01565966664'),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(itemBuilder: (context , index)=> buildUsersItem(Users[index]) ,
      separatorBuilder: (context, index)=>Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20.0,
        ),
        child: Container(
        width: double.infinity,
        height: 1.0,
         color: Colors.grey[300],
    ),
      ),
    itemCount:Users.length, ),
    );
  }
  Widget buildUsersItem(UserModel users) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.blue,
          child: Text(
            '${users.id}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),

        ),
        SizedBox(width: 15.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${users.name}',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            Text(
              '${users.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
