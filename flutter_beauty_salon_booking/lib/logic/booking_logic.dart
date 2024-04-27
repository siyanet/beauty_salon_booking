import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/models/booking_model.dart';
import 'package:flutter_beauty_salon_booking/models/services_model.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
import 'package:flutter_beauty_salon_booking/models/users_model.dart';
import 'package:flutter_beauty_salon_booking/providers/booking_provider.dart';
import 'package:flutter_beauty_salon_booking/providers/selected_provider.dart';
import 'package:flutter_beauty_salon_booking/providers/service_provider.dart';
import 'package:flutter_beauty_salon_booking/providers/time_slot_provider.dart';
import 'package:provider/provider.dart';

class BookingLogic{

   final user = FirebaseAuth.instance.currentUser;

  List<Booking?> userBooking(context){
    String uid = user!.uid;
  
   Provider.of<BookingProvider>(context).getUserBooking(uid);
      List<Booking?>  userBookings = Provider.of<BookingProvider>(context).userBooking ;
      return userBookings;
  }
  Service? bookedservice(context,String serviceId){
    Provider.of<ServiceProvider>(context).setServiceById(serviceId);
            Service ?service = Provider.of<ServiceProvider>(context).serviceById;
           
           return service;

  }
    TimeSlot ? bookedTimeSlot(context,String timeSlotId){
            Provider.of<TimeSlotProvider>(context).setTimeSlotById(timeSlotId);
            TimeSlot ?timeSlotBooked = Provider.of<TimeSlotProvider>(context).timeSlotById;
            return timeSlotBooked;
  }
}