

import 'package:flutter/material.dart';
import 'package:udemy/shared/shared_components/components.dart';
import 'package:udemy/shared/shared_components/constants.dart';



class NewTasksScreen extends StatelessWidget {
final List<Map> tasks;
NewTasksScreen({required this.tasks});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder:(context, index) => buildTaskItem(tasks[index]) ,
        separatorBuilder: (context, index) => Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
        ),
        itemCount: tasks.length,
    );
  }
}
