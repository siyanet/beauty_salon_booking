
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyImage extends StatelessWidget{
  final double width;
  final double height;
  final BoxFit fit;
  final String path;
 const  MyImage({super.key,required this.width,required this.height, required this.fit,required this.path});
  
  @override 
  Widget build(BuildContext context){
    return Image.asset("assets/logo.png",
    width: width,
    height: height,
    fit: fit);}}