import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/components/booking_list.dart';
import 'package:flutter_beauty_salon_booking/logic/booking_logic.dart';
import 'package:flutter_beauty_salon_booking/models/booking_model.dart';
import 'package:flutter_beauty_salon_booking/models/services_model.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
import 'package:flutter_beauty_salon_booking/models/users_model.dart';
import 'package:flutter_beauty_salon_booking/pages/displayservices.dart';
import 'package:flutter_beauty_salon_booking/providers/booking_provider.dart';
import 'package:flutter_beauty_salon_booking/services/booking_services.dart';
import 'package:flutter_beauty_salon_booking/services/services_firestore_service.dart';
import 'package:provider/provider.dart';
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
                    //displayservice(serviceId: booking!.serviceId);

                    // Service ?service = logic.bookedservice(context, booking!.serviceId);
                    // StreamBuilder<Service>(

      //               TimeSlot ?timeSlot = logic.bookedTimeSlot(context,booking.timeSlotId);
      //               print("service $service");
      //               print("timeslot $timeSlot");
      //               if(service == null || timeSlot == null){
      //                 return const  ListTile(title: Text("no service or time slot displayed"),);
      //               }


      //               return ListTile(
      //                    leading: CircleAvatar(
      //   backgroundImage: NetworkImage(service.photo), // Load image from URL
      // ),
      //                 title: Text(service.name),
      //                 subtitle: Text('Duration: ${service.duration}, Price: \$${service.price} booked for ${timeSlot.startTime} - ${timeSlot.endTime}'),
      //                 // Display more fields as needed
      //               );
                  },
                )
             )
              ]
        
          
           );  
         }
  }
}


  //    List<Booking> ?userBookings = BookingLogic().userBooking(context);
      // if(userBookings == null){
      //   print("hello");
      //       return const Scaffold(
      //        body: Center(child: Text("You haven't made any booking yet"),)
      //       );
      //     }
          
      //      return Column(
      //      children:[
      //          Expanded(
      //           child: ListView.builder(
      //             itemCount: userBookings.length,
      //             itemBuilder: (context, index) {
      //               var booking = userBookings[index];
      //               Service ?service = logic.bookedservice(context, booking);
      //               TimeSlot ?timeSlot = logic.bookedTimeSlot(context,booking);
      //               print("service $service");
      //               print("timeslot $timeSlot");
      //               if(service == null || timeSlot == null){
      //                 return const  ListTile(title: Text("no service or time slot displayed"),);
      //               }


      //               return ListTile(
      //                    leading: CircleAvatar(
      //   backgroundImage: NetworkImage(service.photo), // Load image from URL
      // ),
      //                 title: Text(service.name),
      //                 subtitle: Text('Duration: ${service.duration}, Price: \$${service.price} booked for ${timeSlot.startTime} - ${timeSlot.endTime}'),
      //                 // Display more fields as needed
      //               );
      //             },
      //           ),
      //         )]
        
          
      //      );  