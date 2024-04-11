import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
 final void Function()? onTap;
  final String text;
  MyButton({super.key, required this.onTap,required this.text});
  @override 
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin:  EdgeInsets.all(25),
   
        decoration:  BoxDecoration(color:  Theme.of(context).colorScheme.secondary),
        child: Center(child: Text(text),
        ),
        ),
    );
    
    
    }}