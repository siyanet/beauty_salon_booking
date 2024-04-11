import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/components/my_alert_dialog.dart';
import 'package:flutter_beauty_salon_booking/components/my_image.dart';
import 'package:flutter_beauty_salon_booking/components/my_text_field.dart';
import 'package:flutter_beauty_salon_booking/components/mybutton.dart';
import 'package:flutter_beauty_salon_booking/controllers/role_navigator.dart';
import 'package:flutter_beauty_salon_booking/models/users_model.dart';
import 'package:flutter_beauty_salon_booking/services/auth_services.dart';

class register extends StatelessWidget{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  void register_method(BuildContext context) async{
    final _authService = AuthService();
    try{
    UserCredential userCredential =   await _authService.signUpWithEmailAndPassword(emailController.text, passwordcontroller.text);
   
     usermodel userone = usermodel(userCredential.user!.uid,firstNameController.text,lastNameController.text,phoneNumberController.text,"Customer");
 FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("users").doc(userone.id).set(userone.userMap());
    RoleNavigator roleNavigator = RoleNavigator();
    roleNavigator.navigate(context,userCredential);
      //  Navigator.pop(context);
      //   Navigator.pushNamed(context,'/home_page');


    }
    catch (e){
     showDialog(context: context, builder: (context) => MyAlertDialog(title: e.toString()));
    }
  }
  register({super.key});
  
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
        //firstname
          SizedBox(height: 10),
     Padding(padding: EdgeInsets.all(10),
     child:   MyTextField(controller: firstNameController, obsecureText: false,hintText: "Enter First Name",),),
        //lastname
          SizedBox(height: 10),
     Padding(padding: EdgeInsets.all(10),
     child:   MyTextField(controller: lastNameController, obsecureText: false,hintText: "Enter Last Name",),),

        //email
        SizedBox(height: 10),
     Padding(padding: EdgeInsets.all(10),
     child:   MyTextField(controller: emailController, obsecureText: false,hintText: "enter email",),),
     //phonnumber
       SizedBox(height: 10),
     Padding(padding: EdgeInsets.all(10),
     child:   MyTextField(controller: phoneNumberController, obsecureText: false,hintText: "Enter Phone Number",),),

       
            SizedBox(height: 10),
       Padding(padding: EdgeInsets.all(10),
       child: MyTextField(controller: passwordcontroller, obsecureText: true, hintText: "enter password",)),  
            SizedBox(height: 10),
            
        MyButton(onTap: () {register_method(context);}
             , text: "sign up"),
        GestureDetector(
        child: Text("have account login"),
        onTap: () {
          Navigator.pushNamed(context, "/login_page");
        }
       ),


      ],)
    );
  }



}