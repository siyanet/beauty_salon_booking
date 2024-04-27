
// import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
// import 'package:flutter_beauty_salon_booking/services/time_slot_services.dart';



// class TimeSlotGenerator {
//   final DateTime startDate;
//     final int numberOfDays;
//     final int startHour;
//     final int endHour;
//     final int intervalMinutes;
//   // TimeSlotGenerator({
//   //   required this.startDate,
//   //   required this.numberOfDays,
//   //   required this.startHour,
//   //   required this.endHour,
//   //   required this.intervalMinutes,
//   // }) ;

// static List<TimeSlot> generateTimeSlots({
//     required DateTime startDate,
//     required int numberOfDays,
//     required int startHour,
//     required int endHour,
//     required int intervalMinutes,
//   }) {
//       for (int i = 0; i < numberOfDays; i++) {
//     DateTime day = startDate.add(Duration(days: i));
//     DateTime startTime = DateTime(day.year, day.month, day.day, startHour);
//     DateTime endTime = DateTime(day.year, day.month, day.day, endHour);
    
//     while (startTime.isBefore(endTime)) {
//       DateTime slotEndTime = startTime.add(Duration(minutes: intervalMinutes));
//       if (slotEndTime.isAfter(endTime)) {
//         slotEndTime = endTime;
//       }
//       TimeSlotServices timeSlots = TimeSlotServices();
//       timeSlots.addTimeSlot(TimeSlot(startTime: startTime, endTime: slotEndTime));
//       startTime = slotEndTime; // Increment startTime
//     }
//   }}
//     // for (int i = 0; i < numberOfDays; i++) {
//     //   DateTime day = startDate.add(Duration(days: i));
//     //   DateTime startTime = DateTime(day.year, day.month, day.day, startHour);
//     //   DateTime endTime = DateTime(day.year, day.month, day.day, endHour);
//     //   while (startTime.isBefore(endTime)) {
//     //     DateTime slotEndTime = startTime.add(Duration(minutes: intervalMinutes));
//     //     if (slotEndTime.isAfter(endTime)) {
//     //       slotEndTime = endTime;
//     //     }
//     //     TimeSlotServices timeSlots = TimeSlotServices();
//     //     timeSlots.addTimeSlot(TimeSlot(startTime: startTime, endTime: slotEndTime));
//     //     startTime = slotEndTime;
//     //   }
//     // }

//   }


// void main() {
//   // Example: Generate time slots for 30 days from today, with slots from 9 AM to 5 PM, every 30 minutes
//   DateTime startDate = DateTime.now();
//   int numberOfDays = 30;
//   int startHour = 9;
//   int endHour = 17;
//   int intervalMinutes = 30;

//   List<TimeSlot> timeSlots = TimeSlotGenerator.generateTimeSlot(
//     startDate: startDate,
//     numberOfDays: numberOfDays,
//     startHour: startHour,
//     endHour: endHour,
//     intervalMinutes: intervalMinutes,
//   );

//   // Print generated time slots
//   print('Generated Time Slots:');
//   timeSlots.forEach((slot) {
//     print('Start Time: ${slot.startTime}, End Time: ${slot.endTime}');
//   });
// // }
// import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
// import 'package:flutter_beauty_salon_booking/services/time_slot_services.dart';

// class TimeSlotGenerator {
//   static void generateTimeSlots({
//     required DateTime startDate,
//     required int numberOfDays,
//     required int startHour,
//     required int endHour,
//     required int intervalMinutes,
//   }) {
   

//   for (int i = 0; i < numberOfDays; i++) {
//     DateTime day = startDate.add(Duration(days: i));
//     DateTime startTime = DateTime(day.year, day.month, day.day, startHour);
//     DateTime endTime = DateTime(day.year, day.month, day.day, endHour);
    
//     while (startTime.isBefore(endTime)) {
//       DateTime slotEndTime = startTime.add(Duration(minutes: intervalMinutes));
//       if (slotEndTime.isAfter(endTime)) {
//         slotEndTime = endTime;
//       }
//       TimeSlotServices timeSlots = TimeSlotServices();
//       timeSlots.addTimeSlot(TimeSlot(startTime: startTime, endTime: slotEndTime));
//       startTime = slotEndTime; // Increment startTime
//     }
//   }
//   }
// }

// void main() {
//   // Example: Generate time slots for 30 days from today, with slots from 9 AM to 5 PM, every 30 minutes
//   DateTime startDate = DateTime.now();
//   int numberOfDays = 60;
//   int startHour = 9;
//   int endHour = 17;
//   int intervalMinutes = 120;

//   TimeSlotGenerator.generateTimeSlots(
//     startDate: startDate,
//     numberOfDays: numberOfDays,
//     startHour: startHour,
//     endHour: endHour,
//     intervalMinutes: intervalMinutes,
//   );

//   // Print generated time slots
//   print('Generated Time Slots:');

// }
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
import 'package:flutter_beauty_salon_booking/services/time_slot_services.dart';

class TimeSlotGenerator {
  static void generateTimeSlots({
    required DateTime startDate,
    required int numberOfDays,
    required int startHour,
    required int endHour,
    required int intervalMinutes,
  }) {
    // Create a single instance of TimeSlotServices
    TimeSlotServices timeSlots = TimeSlotServices();

    // for (int i = 0; i < numberOfDays; i++) {
    //   DateTime day = startDate.add(Duration(days: i));
    //   DateTime startTime = DateTime(day.year, day.month, day.day, startHour);
    //   DateTime endTime = DateTime(day.year, day.month, day.day, endHour);
      
    //   while (startTime.isBefore(endTime)) {
    //     DateTime slotEndTime = startTime.add(Duration(minutes: intervalMinutes));
    //     if (slotEndTime.isAfter(endTime)) {
    //       slotEndTime = endTime;
    //     }
        
    //     // Add time slot using the single instance of TimeSlotServices
    //     timeSlots.addTimeSlot(TimeSlot(startTime: startTime, endTime: slotEndTime));
    //     startTime = slotEndTime; // Increment startTime
    //   }
    // }
       for (int i = 0; i < numberOfDays; i++) {
    DateTime day = startDate.add(Duration(days: i));
    DateTime startTime = DateTime(day.year, day.month, day.day, startHour);
    DateTime endTime = DateTime(day.year, day.month, day.day, endHour);
    
    while (startTime.isBefore(endTime)) {
      DateTime slotEndTime = startTime.add(Duration(minutes: intervalMinutes));
      if (slotEndTime.isAfter(endTime)) {
        slotEndTime = endTime;
      }
      TimeSlotServices timeSlots = TimeSlotServices();
      timeSlots.addTimeSlot(TimeSlot(startTime: startTime, endTime: slotEndTime));
      startTime = slotEndTime; // Increment startTime
    }
  }
}

// void main() {
//   // Example: Generate time slots for 60 days from today, with slots from 9 AM to 5 PM, every 2 hours
//   DateTime startDate = DateTime.now();
//   int numberOfDays = 60;
//   int startHour = 9;
//   int endHour = 17;
//   int intervalMinutes = 120;

//   TimeSlotGenerator.generateTimeSlots(
//     startDate: startDate,
//     numberOfDays: numberOfDays,
//     startHour: startHour,
//     endHour: endHour,
//     intervalMinutes: intervalMinutes,
//   );

//   // Print generated time slots
//   print('Generated Time Slots:');
// }
}