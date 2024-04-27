import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/models/services_model.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
import 'package:flutter_beauty_salon_booking/models/users_model.dart';

class SelectedProvider extends ChangeNotifier{
  DateTime _selectedDate = DateTime.now();
  TimeSlot? _selectedTimeSlot;
  Service? _selectedService;
  UserModel ? _currentUser;

  DateTime get selectedDate => _selectedDate;
  TimeSlot ? get selectedTimeSlot => _selectedTimeSlot;
  Service get selectedService => _selectedService!;
  UserModel ? get currentUser => _currentUser;

   void setSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  void setSelectedTimeSlot(TimeSlot timeSlot) {
    _selectedTimeSlot = timeSlot;
    notifyListeners();
  }

  void setSelectedService(Service service) {
    _selectedService = service;
    notifyListeners();
  }
  
   void setCurrentUser(Stream<UserModel> currentUserStream) {

       currentUserStream.listen((user) {
      _currentUser = user;
      notifyListeners();
    });
  }




}