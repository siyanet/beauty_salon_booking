import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/pages/customer_home_page_real.dart';
import 'package:flutter_beauty_salon_booking/pages/customer_appointment_page.dart';
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

  CustomerAppointmentPage(),


  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     // appBar: const MyAppBar(),
      
      body: _pages[_selectedIndex],
      bottomNavigationBar: GNav(
        color: Theme.of(context).colorScheme.inversePrimary,
        activeColor: Theme.of(context).colorScheme.primary,
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        tabs: [
          GButton(
             iconColor: Theme.of(context).colorScheme.inversePrimary,
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            iconColor: Theme.of(context).colorScheme.inversePrimary,
            icon: Icons.design_services_rounded,
            text: "Services",
          ),
        
        ],
      ),
    );
  }
}