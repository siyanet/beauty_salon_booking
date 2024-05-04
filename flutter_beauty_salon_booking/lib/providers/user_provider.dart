
import 'package:flutter/foundation.dart';
import 'package:flutter_beauty_salon_booking/models/users_model.dart';
import 'package:flutter_beauty_salon_booking/services/user_service.dart';

class UserProvider extends ChangeNotifier{
  UserService userService = UserService();
  List<UserModel> _usersByListOfIds = [];  
  List<UserModel> get usersByListOfIds => _usersByListOfIds;

  UsrProvider(){
    _initializeUser();
  }
  Future <void> _initializeUser()async{

    notifyListeners();
   }

  Future<void> setUsersByListOfIds(List<String> userIds) async {
    userService.getUsersByListOfIds(userIds).listen((users){
      _usersByListOfIds = users;
      notifyListeners();

    });
  }
   }


