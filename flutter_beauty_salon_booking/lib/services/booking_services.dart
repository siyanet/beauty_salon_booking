import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_beauty_salon_booking/models/booking_model.dart';
import 'package:flutter_beauty_salon_booking/services/services_firestore_service.dart';
class BookingServices{
    final ServiceFirestore serviceFirestore = ServiceFirestore();

  final CollectionReference bookingCollection = FirebaseFirestore.instance.collection('Booking');
  Future<DocumentReference> addBooking(Booking booking)async{
      final latestDocument =
        await bookingCollection.orderBy('id', descending: true).limit(1).get();
      int currentId = 0;

    if (latestDocument.docs.isNotEmpty) {
      currentId = int.parse(latestDocument.docs.first.get('id')) + 1;
    }
    return bookingCollection.add({
      'id': currentId.toString(), 
      'customer_id': booking.customerId,
      'service_id': booking.serviceId,
      'booking_time': booking.timeSlotId,
      'status': booking.status,
    });
  }
Stream<List<Booking>> getBookingStreamByUserId(String userId) { 
  return  bookingCollection.where('customer_id', isEqualTo: userId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Booking(
          
          customerId: doc['customer_id'],
          serviceId: data['service_id'],
          timeSlotId: data['booking_time'],
          status: data['status'],
        );
      }).toList();
    });
  }
Stream<List<Booking>> getBookingStream(){ 
    return bookingCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Booking(
          customerId: doc['customer_id'],
          serviceId: data['service_id'],
          timeSlotId: data['timeSlot_id'],
          status: data['status'],
        );
      }).toList();
    });
  }
}