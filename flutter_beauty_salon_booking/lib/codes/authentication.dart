// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;

// class AuthLogIn with ChangeNotifier{
//   final TextEditingController _usernamecontroller = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//     TextEditingController get usernamecontroller => _usernamecontroller;
//   TextEditingController get passwordcontroller => _passwordController;
//   String _username = '';
//   String _password = "";
//   String get username => _username;
//   String get password => _password;
//   void setUsernamecontroller(String username){
//     _username = username;
//     notifyListeners();
//   }
//   void setPassowrdcontroller(String password){
//     _password = password;
//     notifyListeners();
//   }
//   void setUsername(String username){
//     _username = username;
//     notifyListeners();
//   }
//   void setPassowrd(String password){
//     _password = password;
//     notifyListeners();
//   }

//   Future<void> _login() async{
//     String url = " ";
//     Map<String,String> headers = {Content-Type: 'application/json'};
//     Map<String,String> body = {
//       'username': _usernamecontroller.text,
//       'password': _passwordController.text,
//     };
//     try {
//       final respnose = await http.post(url,headers: headers,body: json.encode(body));
//       if (response.statusCode == 200){

//       }
//       else {
        
//       }
//     }
//     catch (e){}
//   }

// // }
// import 'dart:convert';
// import 'package:http/http.dart' as http;


// class AuthService {
//    static Future<void> login(String username, String password) async {
//   Uri url = Uri.parse("http://your_api_endpoint/login");
// cd // Replace with your API endpoint
//     Map<String, String> headers = {'Content-Type': 'application/json'};
//     Map<String, String> body = {
//       'username': username,
//       'password': password,
//     };

//     try {
//       final response = await http.post(url, headers: headers, body: json.encode(body));
//       if (response.statusCode == 200) {
//         // Authentication successful
//         // Navigate to the next screen or perform desired actions
//         print("Login successful!");
//       } else {
//         // Authentication failed
//         // Show error message to the user
//         print("Login failed. Please try again.");
//       }
//     } catch (e) {
//       // Handle network errors or other exceptions
//       print("Error occurred: $e");
//     }
//   }
// }
// }