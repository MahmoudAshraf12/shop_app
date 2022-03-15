import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final int result;
  final int Age;
  final bool isMale;

  BMIResultScreen({
    required this.result,
    required this.Age,
    required this.isMale,
})
  {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'BMI Result',style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Text(
                'Gender : ${isMale? 'Male' : 'Female'}',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.amber,
                ),
              ),
              Text(
                'Result : $result',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                    color: Colors.amber,
                ),
              ),
              Text(
                'Age : $Age',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                    color: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
