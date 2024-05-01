

import 'dart:js_interop';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/logic/booking_logic.dart';
import 'package:flutter_beauty_salon_booking/logic/datetime_utilities.dart';
import 'package:flutter_beauty_salon_booking/models/booking_model.dart';
import 'package:flutter_beauty_salon_booking/models/services_model.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
import 'package:flutter_beauty_salon_booking/providers/booking_provider.dart';
import 'package:flutter_beauty_salon_booking/providers/service_provider.dart';
import 'package:flutter_beauty_salon_booking/providers/time_slot_provider.dart';
import 'package:flutter_beauty_salon_booking/providers/user_provider.dart';
import 'package:flutter_beauty_salon_booking/services/booking_services.dart';
import 'package:flutter_beauty_salon_booking/services/services_firestore_service.dart';
import 'package:provider/provider.dart';

class CustomerAppointmentPage extends StatefulWidget{

   CustomerAppointmentPage({super.key});

  @override
  State<CustomerAppointmentPage> createState() => _CustomerAppointmentPageState();
}

class _CustomerAppointmentPageState extends State<CustomerAppointmentPage> {
   List<Booking> bookings =[];

   BookingLogic logic = BookingLogic();

 final  BookingServices bookingServices = BookingServices();

 ServiceFirestore serviceFirestore = ServiceFirestore();

  @override 
  Widget build(BuildContext context){
    
   final user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;
        List<String> serviceIds = [];
    List<String>timeSlotIds = [];
     //  List<Booking> userBookings = BookingLogic().userBooking(context);
         Provider.of<BookingProvider>(context).getUserBooking(uid);
       List<Booking> userBookings = Provider.of<BookingProvider>(context).userBooking;
       
         for(Booking booking in userBookings){
      serviceIds.add(booking.serviceId);
     
      timeSlotIds.add(booking.timeSlotId);


    }
      Provider.of<ServiceProvider>(context).setServicesByListIds(serviceIds);
   
    Provider.of<TimeSlotProvider>(context).setTimeSlotByListOfIds(timeSlotIds);
    List<Service> bookedService = Provider.of<ServiceProvider>(context).servicesByListIds;

    List<TimeSlot> bookedTimeSlot = Provider.of<TimeSlotProvider>(context).timeSlotByListOfIds;
     int minListLength = min(userBookings.length, min(bookedService.length, bookedTimeSlot.length));
  
   
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
                  itemCount: minListLength,
                  itemBuilder: (context, index) {
                      var service = bookedService[index];
                var timeSlot = bookedTimeSlot[index];
                   
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


 