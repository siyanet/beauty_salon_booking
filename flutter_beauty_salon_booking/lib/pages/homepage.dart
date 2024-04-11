import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/components/my_alert_dialog.dart';
import 'package:flutter_beauty_salon_booking/services/auth_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
      GestureDetector(
        child: 
       Text("home"),
       onTap: () async {
        
         final _authService = AuthService();
    try{
      await _authService.signOut();
      Navigator.pop(context);
      Navigator.pushNamed(context, "/login_page");
    

    }
    catch (e){
     showDialog(context: context, builder: (context) => MyAlertDialog(title: e.toString()));
    }

       },)
    ));
  }
}