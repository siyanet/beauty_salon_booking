import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';

class TimeSlotServices{
  final CollectionReference timeSlotCollection = FirebaseFirestore.instance.collection('time_slots');
  Future <void> addTimeSlot(TimeSlot timeSlot) async{
    await timeSlotCollection.add(timeSlot.toMap());
  }
  Stream<List<TimeSlot>>getTimeSlotStreamBySelectedDate(DateTime selectedDate){
     DateTime utcSelectedDate = selectedDate.toUtc();
   DateTime startOfDay = DateTime.utc(utcSelectedDate.year, utcSelectedDate.month, utcSelectedDate.day).add(Duration(days: 1));
  DateTime endOfDay = startOfDay.add(const Duration(days: 1));
  Query timeSlotQuery = timeSlotCollection.where('startTime', isGreaterThan: startOfDay).where('startTime',isLessThan: endOfDay);
  return timeSlotQuery.snapshots().map((snapshot){
    if(snapshot.docs.isEmpty){
      return <TimeSlot>[];
    }
    return snapshot.docs.where((doc) => (doc['numberOfTimes'] as int) < 2).map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return TimeSlot(
          id: doc.id,
          startTime: (data['startTime'] as Timestamp).toDate(),
          endTime: (data['endTime'] as Timestamp).toDate(),
          numberOfTimes: data['numberOfTimes'] as int,
        );
    }).toList();
    });
  }

Stream<TimeSlot?>getTimeSlotStreamById(String timeSlotId){
  return timeSlotCollection.doc(timeSlotId)
  .snapshots()
  .map((doc) {
    if(doc.exists){
   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
   return TimeSlot(startTime: data['start_time'], endTime: data['end_time']); 
}
else{
  return null;
}
}
);
}

Stream<List<TimeSlot>>getTimeSlotStreamAll(){
  return timeSlotCollection.snapshots().map((snapshot){
    if(snapshot.docs.isEmpty){
      return <TimeSlot>[];
    }
    return snapshot.docs.where((doc) => (doc['numberOfTimes'] as int) < 2).map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return TimeSlot(
          id: doc.id,
          startTime: (data['startTime'] as Timestamp).toDate(),
          endTime: (data['endTime'] as Timestamp).toDate(),
          numberOfTimes: data['numberOfTimes'] as int,
        );
    }).toList();
    });
  }


 Future<void> bookTimeSlot(String id, TimeSlot timeSlot)async{
  timeSlot.incrementNumberOfTimes();
  timeSlotCollection.doc(id).update(timeSlot.toMap());
 }


}


