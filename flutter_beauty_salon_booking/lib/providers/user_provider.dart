// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_beauty_salon_booking/models/users_model.dart';
// import 'package:flutter_beauty_salon_booking/services/user_service.dart';

// class UseProvider extends ChangeNotifier{
//   UserService userService = UserService();
  
//   UserModel ? _currentUser;
//   UserModel ? get currentUser => _currentUser;
//   UsrProvider(){
//     _initializeUser();
//   }
//   Future <void> _initializeUser()async{
//     await setUser();
//     notifyListeners();
//   }
//   Future<void>setUser()async{
//     userService.getUser().listen((usermodel) {
//       _currentUser = usermodel;
//      });
//     }
//   }


