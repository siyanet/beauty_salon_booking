import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/models/services_model.dart';
class ServiceFirestore{
final CollectionReference servicesCollection  = FirebaseFirestore.instance.collection('services');
 Future<DocumentReference> addService(Service service)async{
  final lastDocument = await servicesCollection.orderBy('id',descending:true).limit(1).get();
  int currentId = 0;
  if(lastDocument.docs.isNotEmpty){
    currentId = int.parse(lastDocument.docs.first.get('id')) + 1;
  }
  return servicesCollection.add({
    'id': currentId.toString(),
    'description': service.description,
    'duration': service.duration,
    'name': service.name,
    'photo': service.photo,
    'price': service.price,
  }
  );
 }
Stream<List<Service>> getAllServicesStream() {
  return servicesCollection.snapshots().map((snapshot) {
    if(snapshot.docs.isEmpty){
      return <Service>[];
    }
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Service(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        price: data['price'],
        duration: data['duration'],
        photo: data['photo'],
      );
    }).toList();
  });
}
// Stream <Service?> getServiceByIdStream(String serviceId) {
//   return servicesCollection.where('id', isEqualTo: serviceId).limit(1)
//       .snapshots()
//       .map((snapshot) {
//          if (snapshot.docs.isNotEmpty) {
//       // Map the document data to TimeSlot object
//       Map<String, dynamic> data = snapshot.docs.first.data();
     
//       return Service(
//         id: data['id'],
//         name: data['name'],
//         description: data['description'],
//         price: data['price'],
//         duration: data['duration'],
//         photo: data['photo'],
//       );
//     }}
    
//     else{
//       return null;
//     }
//     });
//     }


// Stream<Service?> getServiceByIdStream(String serviceId) {
//   return servicesCollection
//       .where('id', isEqualTo: serviceId)
//       .limit(1) // Limit to only one document (optional)
//       .snapshots()
//       .map((snapshot) {
//     if (snapshot.docs.isNotEmpty) {
//       // Map the document data to TimeSlot object
//       Map<String, dynamic> data = snapshot.docs!.first.data();
//       return Service(
//         id: snapshot.docs.first.id,
//        name: data['name'],
//          description: data['description'],
//          price: data['price'],
//          duration: data['duration'],
//          photo: data['photo'],
//         // Add other fields as needed
//       );
//     } else {
//       // Return null if no document found
//       return null;
//     }
//   });
// }

//Stream<Service?> getServiceByIdStream(String serviceId) {
//   return servicesCollection
//       .where('id', isEqualTo: serviceId)
//       .limit(1) // Limit to only one document (optional)
//       .snapshots()
//       .map((snapshot) {
//     if (snapshot.docs.isNotEmpty) {
//       // Map the document data to Service object
//       Object? data = snapshot.docs.first.data();
//       return Service(
//         id: data['id']!,
//         name: data['name']!,
//         description: data!['description'],
//         price: data['price'],
//         duration: data['duration'],
//         photo: data['photo'],
//         // Add other fields as needed
//       );
//     } else {
//       // Return null if no document found
//       return null;
//     }
//   });
// }
Stream<Service?> getServiceByIdStream(String serviceId) {
  return servicesCollection
      .where('id', isEqualTo: serviceId)
      .limit(1) // Limit to only one document (optional)
      .snapshots()
      .map((snapshot) {
    if (snapshot.docs.isNotEmpty) {
      // Map the document data to Service object
      Map<String, dynamic> data = snapshot.docs.first.data() as Map<String,dynamic>;
      return Service(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        price: data['price'],
        duration: data['duration'],
        photo: data['photo'],
        // Add other fields as needed
      );
    } else {
      print("heloo");
      // Return null if no document found
      return null;
    }
  });
}



Stream<List<Service>> getServicesByListIdsStream(List<String> serviceIds) {
  return servicesCollection.where('id', whereIn: serviceIds)
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Service(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        price: data['price'],
        duration: data['duration'],
        photo: data['photo'],
      );
    }).toList();
  });
}

 }