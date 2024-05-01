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
        padding: EdgeInsets.all(6),
        margin:  EdgeInsets.all(6),
   
        decoration:  BoxDecoration(
          
          color:  Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(5)),
        child: Center(child: Text(text,
        style: TextStyle(color: Theme.of(context).colorScheme.tertiary,fontSize: 20) ,),
        ),
        ),
    );
    
    
    }}