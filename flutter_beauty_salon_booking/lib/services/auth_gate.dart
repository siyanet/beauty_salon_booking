import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_beauty_salon_booking/pages/login_pages.dart';
import 'package:flutter_beauty_salon_booking/pages/homepage.dart';

class AuthGate extends StatelessWidget{
  const AuthGate({super.key});
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return HomePage();

          }
          else{
            return LogIn();
          }
        } ,)
    );
  }
}