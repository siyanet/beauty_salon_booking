import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/services/auth_services.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
 
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
     AuthService authService = AuthService();
    return AppBar(
      elevation: 0,
      
      title: Row(   
        children: [
         Container(
         alignment: Alignment.topLeft,
          child: Image.asset('assets/logonew.jpg',
        width: 100,
        height: 100,),

        ),
        Text("Elegance Beauty Salon"),
        ],),
      actions: <Widget>[
        IconButton(
        icon: Icon(Icons.logout,
        
        ),
        onPressed:() {
          authService.signOut();}
        ),
         
        
      ],

    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}