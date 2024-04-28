import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
import 'package:flutter_beauty_salon_booking/services/time_slot_services.dart';

class TimeSlotDisplay extends StatelessWidget {

 TimeSlotServices timeSlotServices = TimeSlotServices();

   TimeSlotDisplay();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder <TimeSlot?>(
        stream: timeSlotServices.getTimeSlotStreamById("0"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Display a loading indicator while waiting for data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
           // Display an error message if an error occurs
          } 
        else if(snapshot == null){
          return Text("error");
        }

          
          else {
            final timeSlot = snapshot.data;
            if (timeSlot == null) {
              return Text('Time Slot not found'); // Display a message if the time slot does not exist
            } else {
              // Display the time slot details
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${timeSlot.id}'),
                  Text('Start Time: ${timeSlot.startTime}'),
                  Text('End Time: ${timeSlot.endTime}'),
                  // Display other fields as needed
                ],
              );
            }
          }
        },
      );
  }
}

  