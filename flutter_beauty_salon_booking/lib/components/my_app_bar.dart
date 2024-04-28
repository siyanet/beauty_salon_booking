
// import 'package:flutter/material.dart';
// import 'package:flutter_beauty_salon_booking/components/mybutton.dart';
// import 'package:flutter_beauty_salon_booking/services/auth_services.dart';

// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final AuthService authService = AuthService();
//    @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: preferredSize,
//       child: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.background,
//         title: const Text("Betty Beauty Salon"),
//         centerTitle: true,
//         actions: [
//           MyButton(onTap: () => authService.signOut(),
//            text: "log out")
//         ],
      
//       ),
//     ) ;
//   }
// }