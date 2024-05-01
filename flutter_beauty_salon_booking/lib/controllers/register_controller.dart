import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/components/my_alert_dialog.dart';
import 'package:flutter_beauty_salon_booking/controllers/role_navigator.dart';
import 'package:flutter_beauty_salon_booking/models/users_model.dart';
import 'package:flutter_beauty_salon_booking/services/auth_services.dart';
import 'package:flutter_beauty_salon_booking/services/user_service.dart';

class RegisterController{
    final TextEditingController emailController;
  final TextEditingController passwordcontroller ;
  final TextEditingController phoneNumberController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController ;
 
  RegisterController({
    required this.emailController,
    required this.firstNameController,
    required this.passwordcontroller,
    required this.lastNameController,
    required this.phoneNumberController,

  });
void register_method(BuildContext context) async {
  final _authService = AuthService();
  final _userService = UserService();
  // Perform validation for empty fields
  if (emailController.text.isEmpty ||
      passwordcontroller.text.isEmpty ||
      phoneNumberController.text.isEmpty ||
      firstNameController.text.isEmpty ||
      lastNameController.text.isEmpty) {
    showDialog(
      context: context,
      builder: (context) => MyAlertDialog(
        title: 'All fields are required',
      ),
    );
    return;
  }

  // Validation for email pattern
  final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailPattern.hasMatch(emailController.text)) {
    showDialog(
      context: context,
      builder: (context) => MyAlertDialog(
        title: 'Invalid email format',
      ),
    );
    return;
  }

  // Validation for phone number format
  final phoneNumberPattern = RegExp(r'^[0-9]{10}$');
  if (!phoneNumberPattern.hasMatch(phoneNumberController.text)) {
    showDialog(
      context: context,
      builder: (context) => MyAlertDialog(
        title: 'Invalid phone number format',
      ),
    );
    return;
  }

  

  try {
    // Attempt to register the user
    UserCredential userCredential = await _authService.signUpWithEmailAndPassword(
      emailController.text,
      passwordcontroller.text,
    );

    // Create a UserModel object
    UserModel userone = UserModel(
      id: userCredential.user!.uid,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phoneNumber: phoneNumberController.text,
      role: "Customer",
    );

    // Add the user to the database
    _userService.addUser(userone);

    // Navigate to the appropriate screen based on user role
    RoleNavigator roleNavigator = RoleNavigator();
    roleNavigator.navigate(context, userCredential);
  } catch (e) {
    // Show alert dialog for error
    showDialog(
      context: context,
      builder: (context) => MyAlertDialog(
        title: e.toString(),
      ),
    );
  }
}

   }
// 