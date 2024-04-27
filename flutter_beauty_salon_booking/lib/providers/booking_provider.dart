import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/models/booking_model.dart';
import 'package:flutter_beauty_salon_booking/services/booking_services.dart';
class BookingProvider extends ChangeNotifier{
  BookingServices bookingServices = BookingServices();
 List<Booking> _booking = [];
 List<Booking>_userBooking = [];
 List<Booking> get booking => _booking;
 List<Booking> get userBooking => _userBooking;
 BookingProvider(){
  _initializeBooking();
 }
 Future<void>_initializeBooking()async{
  await getBooking();
  notifyListeners();
  }
  Future<void> getBooking()async{
 bookingServices.getBookingStream().listen((bookings) {
      _booking = bookings;
      notifyListeners();
      });}
    
  Future<void> getUserBooking(String id)async{ 
 bookingServices.getBookingStreamByUserId(id).listen((bookings) {
      _userBooking = bookings;
      notifyListeners();
      });}
     
    
 }

