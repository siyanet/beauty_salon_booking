import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/pages/service_tile.dart';
import 'package:flutter_beauty_salon_booking/providers/service_provider.dart';
import 'package:flutter_beauty_salon_booking/services/auth_services.dart';
import 'package:provider/provider.dart';

// class CustomerHome extends StatelessWidget {
//   const CustomerHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AuthService authService = AuthService();
//     return Consumer<ServiceProvider>(
//       builder: (context,value,child) => Scaffold(
//         appBar: AppBar(
//           title: Text('Services'),
//         ),
//         body: Column(
//           children: [
//             StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance.collection('services').snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(child: Text('No services found'));
//                 }
//                 return Expanded(child:  ListView(
//         children: [
//           const SizedBox(height: 25,),     
//              Center(
//             child: Text("pick"),
//           ),
//            SizedBox(
//         height: 550,
//         child: ListView.builder(
//           itemCount: snapshot.data!.docs.length,
//           itemBuilder: (context,index){
//             var services = snapshot.data!.docs[index];
            
//             return ServiceTile(service:  services);
//           //  return Provider<QueryDocumentSnapshot>.value(
//           //                     value: services,
//           //                     child: ServiceTile(),
//           //                   );
//         }),
//       ),
      
      
//         ],),
              
//              );
//       //  return Expanded(
//       //             child: ListView.builder(
//       //               itemCount: snapshot.data!.docs.length,
//       //               itemBuilder: (context, index) {
//       //                 var serviceSnapshot = snapshot.data!.docs[index];
//       //                 return GestureDetector(
//       //                   onTap: () {
//       //                     // Set the selected service using ServiceProvider
//       //                     Provider.of<ServiceProvider>(context, listen: false).setService(serviceSnapshot);
//       //                   },
//       //                   child: ServiceTile(),
//       //                 );
//       //               },
//       //             ),
//       //           );
//               },
//        ), ],),
      
      
      
      
      
      
      
      
      
//       ),
//     );
//   }
// }