import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/controllers/my_app_bar.dart';
import 'package:flutter_beauty_salon_booking/pages/customer_home_page.dart';
import 'package:flutter_beauty_salon_booking/pages/customer_home_page_real.dart';
import 'package:flutter_beauty_salon_booking/pages/customer_appointment_page.dart';
import 'package:flutter_beauty_salon_booking/pages/displayservices.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomerNavigatorPage extends StatefulWidget {

  
  const CustomerNavigatorPage({super.key});

  @override
  _CustomerNavigatorPageState createState() => _CustomerNavigatorPageState();
}

class _CustomerNavigatorPageState extends State<CustomerNavigatorPage> {
  int _selectedIndex = 0;



  final List<Widget> _pages = [
   CustomerHomePageReal(),
   displayservice(),
  // CustomerAppointmentPage(),
 // CustomerServicePage(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     // appBar: const MyAppBar(),
      
      body: _pages[_selectedIndex],
      bottomNavigationBar: GNav(
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.design_services_rounded,
            text: "Services",
          ),
          // GButton(icon: Icons.access_alarm,
          // text: "hello",),
        ],
      ),
    );
  }
}