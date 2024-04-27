import 'package:flutter_beauty_salon_booking/models/services_model.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';

class Booking{
  final String customerId;
  final String serviceId;
  final String timeSlotId;
  final String status;
  Booking({required this.customerId,required this.serviceId,required this.timeSlotId, required this.status});



  
  Map<String,dynamic> toMap(){
    return{
      'customerId': customerId,
      'serviceId': serviceId,
      'timeSlotId': timeSlotId,
      'status': status,
    };
  }
  }

