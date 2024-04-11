import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;

  const MyAlertDialog({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      
    );
  }
}