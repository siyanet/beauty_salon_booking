
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
import 'package:flutter_beauty_salon_booking/services/time_slot_services.dart';

class TimeSlotProvider extends ChangeNotifier{
 // DateTime selectedDate;
   TimeSlotServices timeSlotServices = TimeSlotServices();

  List <TimeSlot> _timeSlotBySelectedDate = [];
  List <TimeSlot> _timeSlotAll = [];
   List<TimeSlot> _timeSlotByListOfIds = [];
    List <TimeSlot> get timeSlotAll => _timeSlotAll ;
    List<TimeSlot> get timeSlotByListOfIds => _timeSlotByListOfIds;
   
  
  List<TimeSlot> get timeSlotBySelectedDate => _timeSlotBySelectedDate;
  TimeSlot ? _timeSlotById;
  TimeSlot? get timeSlotById => _timeSlotById; 
  TimeSlotProvider(){
    _initializeServices();
   }
   //because we can't assign setService directly to service provider it should wait untill service is set to notify 
  
  Future<void>setTimeSlotBySelectedDate(DateTime selectedDate)async{
    timeSlotServices.getTimeSlotStreamBySelectedDate(selectedDate).listen((timeSlot) {
      _timeSlotBySelectedDate = timeSlot;
      notifyListeners();
    });}
Future<void>setTimeSlotAll()async{
    timeSlotServices.getTimeSlotStreamAll().listen((timeSlot) {
      _timeSlotAll = timeSlot;
      notifyListeners();
    });
}
     Future<void>setTimeSlotById(String timeSlotId)async{
    timeSlotServices.getTimeSlotStreamById(timeSlotId).listen((timeSlot) {
      _timeSlotById = timeSlot;
      notifyListeners();
    });
  }
Future<void>setTimeSlotByListOfIds(List<String>timeSlotIds) async{
  timeSlotServices.getTimeSlotByListOfIds(timeSlotIds).listen((timeSlots){
   _timeSlotByListOfIds = timeSlots;
   notifyListeners();

  });
}

  Future<void>_initializeServices()async{
   await setTimeSlotAll();
    notifyListeners();
  }
  
  
  
  
  }