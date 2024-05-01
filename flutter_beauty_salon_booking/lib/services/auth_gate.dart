// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_beauty_salon_booking/pages/login_pages.dart';

// // class AuthGate extends StatelessWidget{
// //   const AuthGate({super.key});
// //   @override 
// //   Widget build(BuildContext context){
// //     return Scaffold(
// //       body: StreamBuilder(
// //         stream: FirebaseAuth.instance.authStateChanges(),
// //         builder: (context, snapshot){
// //           if(snapshot.hasData){
// //           //  return HomePage();
// //                Map<String, dynamic> userData = snapshot.data!() as Map<String, dynamic>;

// //       // Retrieve and return the "role" field
// //       String role = userData['role'];
// //       if (role == "Manager"){
// //         Navigator.pushNamed(context,"/manager_home_page");
// //       }
// //       else if(role == "Customer"){
// //         Navigator.pushNamed(context, "/customer_home_page");
// //       }

// //           }
// //           else{
// //             return LogIn();
// //           }
// //         } ,)
// //     );
// //   }
// // }

// // Reference to the user document in Firestore
// Query<Map<String, dynamic>> userRef = FirebaseFirestore.instance.collection('users').where('id', isEqualTo: userCredential.user!.uid);

// // Get the user document snapshots
// QuerySnapshot<Map<String, dynamic>> userSnapshot = await userRef.get();

// // Check if the user document exists
// if (!userSnapshot.docs.isEmpty) {
//   // Get the first user document
//   DocumentSnapshot<Map<String, dynamic>> userData = userSnapshot.docs.first;

//   // Retrieve and return the "role" field
//   String? role = userData['role'] as String?;
//   if (role == "Manager") {
//     Navigator.pop(context);
//     Navigator.pushNamed(context, "/manager_home_page");
//   } else if (role == "Customer") {
//     Navigator.pop(context);
//     Navigator.pushNamed(context, "/customer_home_page");
//   } else {
//     Navigator.pop(context);
//     Navigator.pushNamed(context, "/login_page");
//   }
// } else {
//   // Handle the case where the user document does not exist
//   // This could be due to an error or if the user document was not found
//   // You can display an error message or take appropriate action here
// }





// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_beauty_salon_booking/pages/cusomer_navigator_page.dart';
// import 'package:flutter_beauty_salon_booking/pages/customer_home_page.dart';
// import 'package:flutter_beauty_salon_booking/pages/login_pages.dart';
// import 'package:flutter_beauty_salon_booking/pages/manager_navigator_page.dart';
// import 'package:flutter_beauty_salon_booking/providers/selected_provider.dart';
// import 'package:provider/provider.dart';


// class AuthGate extends StatelessWidget {
//   const AuthGate({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//            if (!snapshot.hasData) {
//             // User is signed in
//             String uid = snapshot.data!.uid;
           
//             return FutureBuilder<String?>(
//               future: getUserRole(uid),
//               builder: (context, roleSnapshot) {
//                 if (roleSnapshot.connectionState == ConnectionState.waiting) {
//                   // Waiting for role data to be fetched
//                   return Center(child: CircularProgressIndicator());
//                 } else if (roleSnapshot.hasData) {
//                   // Role data fetched successfully
//                   String role = roleSnapshot.data!;
//                   if (role == "Manager") {
//                     return ManagerNavigatorPage();
//                    }
//                   else if (role == "Customer") {
//                     return CustomerNavigatorPage();
//                  } 
//                   else {
//                     // Handle other roles
//                     return Scaffold(
//                       body: Center(child: Text("Unknown role")),
//                     );
//                   }
//                 } else {
//                   // Error fetching role data
//                   return Scaffold(
//                     body: Center(child: Text("Error fetching role")),
//                   );
//                 }
//               },
//             );
//           } else {
//            // User is not signed in
//             return LogIn();
//          }
//         },
//       ),
//     );
//   }

//   Future<String?> getUserRole(String? userId) async {
//     if (userId != null) {
//       try {
//         QuerySnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance
//     .collection('users')
//     .where('id', isEqualTo: userId)
//     .get();

// if (userSnapshot.docs.isNotEmpty) {
//   // Access the first document found with the matching 'id' field
 
//         // Reference to the user document in Firestore
//         DocumentSnapshot<Map<String, dynamic>> userData = userSnapshot.docs.first;

//           // Retrieve and return the "role" field
//           return userData['role'];
//         } else {
//           // User document does not exist
//           print('User document does not exist');
//           return null;
//         }
//       } catch (error) {
//         // Error handling
//         print('Error retrieving user role: $error');
//         return null;
//       }
//     } else {
//       // User ID is null
//       return null;
//     }
//   }
//   void getCurrentUserId() {
//   // Retrieve the current user
//   User? user = FirebaseAuth.instance.currentUser;

//   if (user != null) {
//     // If the user is signed in, get the UID
//     String uid = user.uid;
//     print('Current user ID (UID): $uid');
//   } else {
//     // If no user is signed in
//     print('No user is currently signed in.');
//   }
// }
  
  
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_beauty_salon_booking/pages/cusomer_navigator_page.dart';

import 'package:flutter_beauty_salon_booking/pages/login_pages.dart';
import 'package:flutter_beauty_salon_booking/pages/manager_navigator_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            // User is not signed in
            return LogIn();
          }
          // User is signed in
          String uid = snapshot.data!.uid;
          return FutureBuilder<String?>(
            future: getUserRole(uid),
            builder: (context, roleSnapshot) {
              if (roleSnapshot.connectionState == ConnectionState.waiting) {
                // Waiting for role data to be fetched
                return Center(child: CircularProgressIndicator());
              } else if (roleSnapshot.hasData) {
                // Role data fetched successfully
                String role = roleSnapshot.data!;
                if (role == "Manager") {
                  return ManagerNavigatorPage();
                } else if (role == "Customer") {
                  return CustomerNavigatorPage();
                } else {
                  // Handle other roles
                  return Scaffold(
                    body: Center(child: Text("Unknown role")),
                  );
                }
              } else if (roleSnapshot.hasError) {
                // Error fetching role data
                return Scaffold(
                  body: Center(child: Text("Error fetching role: ${roleSnapshot.error}")),
                );
              } else {
                // Role data not available
                return Scaffold(
                  body: Center(child: Text("Role data not available")),
                );
              }
            },
          );
        },
      ),
    );
  }

  Future<String?> getUserRole(String? userId) async {
    if (userId != null) {
      try {
        QuerySnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: userId)
            .get();
        if (userSnapshot.docs.isNotEmpty) {
          // Access the first document found with the matching 'id' field
          DocumentSnapshot<Map<String, dynamic>> userData = userSnapshot.docs.first;
          // Retrieve and return the "role" field
          return userData['role'];
        } else {
          // User document does not exist
          print('User document does not exist');
          return null;
        }
      } catch (error) {
        // Error handling
        print('Error retrieving user role: $error');
        return null;
      }
    } else {
      // User ID is null
      return null;
    }
  }
}

