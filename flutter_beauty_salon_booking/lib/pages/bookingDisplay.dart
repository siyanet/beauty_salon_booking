import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/models/booking_model.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
import 'package:flutter_beauty_salon_booking/services/booking_services.dart';
import 'package:flutter_beauty_salon_booking/services/time_slot_services.dart';

// Assuming you have a Booking class defined somewhere

// Assuming you have a Stream<List<Booking>> getBookingStream() function defined somewhere

class BookingListWidget extends StatelessWidget {
 //final BookingServices booking = BookingServices();
 TimeSlotServices timeSlotServices = TimeSlotServices();
 List<String> timeSlotIds = ['1','2','0'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking List'),
      ),
      body: StreamBuilder<List<TimeSlot>>(
        stream: timeSlotServices.getTimeSlotByListOfIds(timeSlotIds),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No bookings available.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                TimeSlot timeSlot = snapshot.data![index];
                return ListTile(
                  title: Text('Customer ID: ${timeSlot.id}'),
                  subtitle: Text('Service ID: ${timeSlot.startTime}\n'
                      'Time Slot ID: ${timeSlot.endTime}\n'
                     // 'Status: ${booking.status}'),
                  )  );
              },
            );
          }
        },
      ),
    );
  }
}


