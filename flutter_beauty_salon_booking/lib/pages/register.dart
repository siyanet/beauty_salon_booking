import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/components/my_image.dart';
import 'package:flutter_beauty_salon_booking/components/my_text_field.dart';
import 'package:flutter_beauty_salon_booking/components/mybutton.dart';
import 'package:flutter_beauty_salon_booking/controllers/register_controller.dart';
class register extends StatelessWidget{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  register({super.key});
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: 
     SingleChildScrollView(child: Column(
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
            
        MyButton(onTap: () {
          RegisterController reg =  RegisterController(emailController: emailController, firstNameController: firstNameController, passwordcontroller: passwordcontroller, lastNameController: lastNameController, phoneNumberController: phoneNumberController);
          reg.register_method(context);}
             , text: "sign up"),
        GestureDetector(
        child: Text("have account login",style: Theme.of(context).textTheme.bodyLarge),
        onTap: () {
          Navigator.pushNamed(context, "/login_page");
        }
       ),
      ],))
    );
  }



}