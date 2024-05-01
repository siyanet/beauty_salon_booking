
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/components/mybutton.dart';
import 'package:flutter_beauty_salon_booking/services/auth_services.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AuthService authService = AuthService();
   @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
        // Container(
          //   alignment: Alignment.topLeft,
          //   child:    MyButton(onTap: () => authService.signOut(),
          //  text: "log out"),
          // ),
      child: AppBar(
  backgroundColor: Theme.of(context).colorScheme.background,
  title: Text(
    "Betty Beauty Salon",
    style: Theme.of(context).textTheme.bodyLarge,
    textAlign: TextAlign.center,
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: IconButton(
        icon: Icon(Icons.logout),
        onPressed: () {
         authService.signOut();
     //    Navigator.
        },
      ),
    ),
  ],
),

     
    ) ;
  }
}