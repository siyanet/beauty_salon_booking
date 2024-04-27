import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/services/auth_services.dart';

class ManagerHomePage extends StatelessWidget {
   ManagerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      body:Center( 
       child: ElevatedButton(child: Icon(Icons.logout,size: 30,color: Colors.black),
      onPressed: (){
         authService.signOut();
       //  a code to generate time slot
          //  TimeSlotGenerator timeSlotGenerator = TimeSlotGenerator(startDate: DateTime.now(), numberOfDays: 60, startHour: 8, endHour: 17, intervalMinutes: 120);

          //       timeSlotGenerator.genereateTimeSlot();
      },)

      )
      );
  }
}