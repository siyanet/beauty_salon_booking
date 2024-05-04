
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';

class TimeSlotServices{
  final CollectionReference timeSlotCollection = FirebaseFirestore.instance.collection('time_slots');
  Future <DocumentReference> addTimeSlot (int id,TimeSlot timeSlot) async{
    final lastDocument = await timeSlotCollection.orderBy('id',descending: true).limit(1).get();
   
    return timeSlotCollection.add({
      'id': id.toString(),
      'startTime': timeSlot.startTime,
      'endTime':timeSlot.endTime,
      'numberOfTimes': timeSlot.numberOfTimes,

    }  );
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
          id: data['id'],
          startTime: (data['startTime'] as Timestamp).toDate(),
          endTime: (data['endTime'] as Timestamp).toDate(),
          numberOfTimes: data['numberOfTimes'] as int,
        );
    }).toList();
    });

  }


Stream<TimeSlot?> getTimeSlotStreamById(String timeSlotId) {
  return timeSlotCollection
      .where('id', isEqualTo: timeSlotId)
      .limit(1) // Limit to only one document (optional)
      .snapshots()
      .map((snapshot) {
    if (snapshot.docs.isNotEmpty) {
      // Map the document data to TimeSlot object
      Map<String, dynamic> data = snapshot.docs.first.data() as Map<String,dynamic>;
      return TimeSlot(
        id: data['id'],
        startTime: (data['startTime']as Timestamp).toDate(),
        endTime: (data['endTime']).toDate(),
        // Add other fields as needed
      );
    } else {
      // Return null if no document found
      return null;
    }
  });
}


Stream<List<TimeSlot>>getTimeSlotStreamAll(){
  return timeSlotCollection.snapshots().map((snapshot){
    if(snapshot.docs.isEmpty){
      return <TimeSlot>[];
    }
    return snapshot.docs.where((doc) => (doc['numberOfTimes'] as int) < 2).map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return TimeSlot(
          id: data['id'],
          startTime: (data['startTime'] as Timestamp).toDate(),
          endTime: (data['endTime'] as Timestamp).toDate(),
          numberOfTimes: data['numberOfTimes'] as int,
        );
    }).toList();
    });
  }
  Stream<List<TimeSlot>>getTimeSlotByListOfIds(List<String> timeSlotIds){
    return timeSlotCollection.where('id',whereIn: timeSlotIds).snapshots().map(
      (snapshot){
        return snapshot.docs.map((doc){
          Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
          return TimeSlot(
            id: data['id'],
            startTime: (data['startTime'] as Timestamp).toDate(),
            endTime: (data['endTime'] as Timestamp).toDate(),
          );
        }).toList();
      }
    );
  }


 Future<void> bookTimeSlot(String id, TimeSlot timeSlot)async{
  timeSlot.incrementNumberOfTimes();
  timeSlotCollection.doc(id).update(timeSlot.toMap());
 }


}


