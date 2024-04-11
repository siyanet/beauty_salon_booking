import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  final TextEditingController controller;
  final bool obsecureText;

  final String hintText;
 const  MyTextField({super.key, required this.controller,required this.obsecureText,required this.hintText});
  @override 
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
        borderRadius: BorderRadius.all(Radius.circular(20))),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
        ),
     

    );
    }}