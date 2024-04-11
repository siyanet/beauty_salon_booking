import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/codes/authentication.dart';
import 'package:flutter_beauty_salon_booking/components/my_alert_dialog.dart';
import 'package:flutter_beauty_salon_booking/components/my_image.dart';
import 'package:flutter_beauty_salon_booking/components/my_text_field.dart';
import 'package:flutter_beauty_salon_booking/components/mybutton.dart';
import 'package:flutter_beauty_salon_booking/services/auth_services.dart';


class LogIn extends StatelessWidget{
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  void login(BuildContext context) async{
    final _authService = AuthService();
    try{
      await _authService.signInWithEmailAndPassword(usernamecontroller.text, passwordcontroller.text);
   Navigator.pop(context);
    Navigator.pushNamed(context,'/home_page');

    }
    catch (e){
     showDialog(context: context, builder: (context) => MyAlertDialog(title: e.toString()));
    }
  }
  LogIn({super.key});
  
  @override 
  Widget build(BuildContext context){
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
           
       MyImage(
          path: "assets/logo.png",
          width: 90,
          height: 90,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
     Padding(padding: EdgeInsets.all(10),
     child:   MyTextField(controller: usernamecontroller, obsecureText: false,hintText: "enter username",),),

       
            SizedBox(height: 10),
       Padding(padding: EdgeInsets.all(10),
       child: MyTextField(controller: passwordcontroller, obsecureText: true, hintText: "enter password",)),  
            SizedBox(height: 10),
            
        MyButton(onTap: () async {
          login(context); },
          text: "log in"),
           GestureDetector(
        child: Text("forgot password"),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context,"/password_reset_page");
          
        }),

        GestureDetector(
        child: Text("create account"),
        onTap: ()=>{
          
          Navigator.pushNamed(context,"/registeration_page")
          
        }),
        Text("continue with"),
        GestureDetector(
          child: Icon(Icons.home),
          onTap: () => {},
        )


      ],)
    );
  }



}