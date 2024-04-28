import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/models/services_model.dart';
import 'package:flutter_beauty_salon_booking/services/services_firestore_service.dart';

// class displayservice {
//   final String serviceId  ;
//   ServiceFirestore serviceFirestore = ServiceFirestore();

//   displayservice({required this.serviceId});

//  {
//     return
//     StreamBuilder<Service?>(
//       stream: serviceFirestore.getServiceByIdStream(serviceId),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator(); // Display a loading indicator while waiting for data
//         } else if (snapshot.hasError) {
//           return Center(child:Text('Error: ${snapshot.error}')); // Display an error message if an error occurs
//         } else {
//           final service = snapshot.data;
//           if (service == null) {
//             return Text('Service not found'); // Display a message if the service does not exist
//           } else {
//             // Display the service details
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Name: ${service.name}'),
//                 Text('Description: ${service.description}'),
//                 Text('Price: ${service.price}'),
//                 Text('Duration: ${service.duration}'),
//                 // Display the photo, you can use Image.network if photo is a URL
//                 // Image.network(service.photo),
//                 // or use Image.memory if photo is a byte array
//                 // Image.memory(service.photo),
//               ],
//             );
//           }
//         }
//       },
//      );
//   }
// }
