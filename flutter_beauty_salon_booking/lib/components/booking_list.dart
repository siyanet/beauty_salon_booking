// import 'package:flutter/material.dart';
// import 'package:flutter_beauty_salon_booking/logic/booking_logic.dart';
// import 'package:flutter_beauty_salon_booking/models/booking_model.dart';
// import 'package:flutter_beauty_salon_booking/models/services_model.dart';
// import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';

// class BookingList extends StatelessWidget {
//   final List<Booking> bookings;
//   BookingList({required this.bookings});
//  BookingLogic logic = BookingLogic();

//   @override
//   Widget build(BuildContext context) {
//      return Expanded(
//                 child: ListView.builder(
//                   itemCount: bookings.length,
//                   itemBuilder: (context, index) {
//                     var booking = bookings[index];
//                     Service ?service = logic.bookedservice(context, booking);
//                     TimeSlot ?timeSlot = logic.bookedTimeSlot(context,booking);
//                     if(service == null || timeSlot == null){
//                       return const  ListTile(title: Text("no service or time slot displayed"),);
//                     }


//                     return ListTile(
//                          leading: CircleAvatar(
//         backgroundImage: NetworkImage(service.photo), // Load image from URL
//       ),
//                       title: Text(service.name),
//                       subtitle: Text('Duration: ${service.duration}, Price: \$${service.price} booked for ${timeSlot.startTime} - ${timeSlot.endTime}'),
//                       // Display more fields as needed
//                     );
//                   },
//                 ),
//               );
//   }
// }
