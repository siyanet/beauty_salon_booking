import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/pages/manager_service_page.dart';
import 'package:flutter_beauty_salon_booking/pages/manger_home_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ManagerNavigatorPage extends StatefulWidget {

  
  const ManagerNavigatorPage({Key? key, }) : super(key: key);

  @override
  _ManagerNavigatorPageState createState() => _ManagerNavigatorPageState();
}

class _ManagerNavigatorPageState extends State<ManagerNavigatorPage> {
  int _selectedIndex = 0;



  final List<Widget> _pages = [
   ManagerHomePage(),
   
   //BookingListWidget(),
    ManagerServicePage(),
  ];

   
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
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
        ],
      ),
    );
  }
}