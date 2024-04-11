import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/firebase_options.dart';
import 'package:flutter_beauty_salon_booking/pages/homepage.dart';
import 'package:flutter_beauty_salon_booking/pages/login_pages.dart';
import 'package:flutter_beauty_salon_booking/pages/register.dart';
import 'package:flutter_beauty_salon_booking/pages/reset_password_page.dart';
import 'package:flutter_beauty_salon_booking/services/auth_gate.dart';
import 'package:provider/provider.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
       routes: {
        "/registeration_page":(context)=> register(),
        "/login_page":(context) => LogIn(),
        "/home_page": (context) => HomePage(),
        "/password_reset_page":(context) => ForgotPasswordPage(),
      // "/shop_page":(context)=>const ShopPage(),
       // "/cart_page":(context)=>const CartPage(),
      },
    );
    
  }
}
