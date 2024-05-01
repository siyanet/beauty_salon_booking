

import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/logic/booking_logic.dart';
import 'package:flutter_beauty_salon_booking/logic/datetime_utilities.dart';
import 'package:flutter_beauty_salon_booking/models/booking_model.dart';
import 'package:flutter_beauty_salon_booking/models/services_model.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
import 'package:flutter_beauty_salon_booking/services/booking_services.dart';
import 'package:flutter_beauty_salon_booking/services/services_firestore_service.dart';

class CustomerAppointmentPage extends StatelessWidget{
   List<Booking> bookings =[];
   BookingLogic logic = BookingLogic();
 final  BookingServices bookingServices = BookingServices();
 ServiceFirestore serviceFirestore = ServiceFirestore();
   CustomerAppointmentPage({super.key});
  @override 
  Widget build(BuildContext context){
       List<Booking?> userBookings = BookingLogic().userBooking(context);
      if(userBookings.isEmpty){
            return const Scaffold(
             body: Center(child: Text("You haven't made any booking yet"),)
            );
          }
         else{
   
           return Column(
           children:[
               Expanded(
                child: ListView.builder(
                  itemCount: userBookings.length,
                  itemBuilder: (context, index) {
                    var booking = userBookings[index];
                  Service ?service = logic.bookedservice(context, booking!.serviceId);
                    TimeSlot ?timeSlot = logic.bookedTimeSlot(context,"0");
                    return ListTile(
                         leading: CircleAvatar(
        backgroundImage: NetworkImage(service!.photo), // Load image from URL
      ),
                       title:  Text(service.name,style: Theme.of(context).textTheme.bodyLarge),
                       subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                       Text('Duration: ${service.duration}',style: Theme.of(context).textTheme.bodyMedium),
                       Text('Price: \$${service.price}' ,style: Theme.of(context).textTheme.bodyMedium),
                //  Text('  booked for ${timeSlot!.startTime} - ${timeSlot.endTime}'),
                  Text('Booked for ${DateTimeUtils.formatDateTime(timeSlot!.startTime)} - ${timeSlot.endTime.hour}: ${timeSlot.endTime.minute}${timeSlot.endTime.second}',style: Theme.of(context).textTheme.bodyMedium),


                      
            ] ));
           }
                   
                )
             )
              ]
        
          
           );  
         }
  }
}


 