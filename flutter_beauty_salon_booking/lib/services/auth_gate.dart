// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_beauty_salon_booking/pages/login_pages.dart';
// import 'package:flutter_beauty_salon_booking/pages/homepage.dart';

// class AuthGate extends StatelessWidget{
//   const AuthGate({super.key});
//   @override 
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot){
//           if(snapshot.hasData){
//           //  return HomePage();
//                Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;

//       // Retrieve and return the "role" field
//       String role = userData['role'];
//       if (role == "Manager"){
//         Navigator.pushNamed(context,"/manager_home_page");
//       }
//       else if(role == "Customer"){
//         Navigator.pushNamed(context, "/customer_home_page");
//       }

//           }
//           else{
//             return LogIn();
//           }
//         } ,)
//     );
//   }
// }




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/pages/customer_home_page.dart';
import 'package:flutter_beauty_salon_booking/pages/login_pages.dart';

import 'package:flutter_beauty_salon_booking/pages/manger_home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // User is signed in
            String? uid = snapshot.data!.uid;
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
                    return ManagerHomePage();
                  } else if (role == "Customer") {
                    return CustomerHomePage();
                  } else {
                    // Handle other roles
                    return Scaffold(
                      body: Center(child: Text("Unknown role")),
                    );
                  }
                } else {
                  // Error fetching role data
                  return Scaffold(
                    body: Center(child: Text("Error fetching role")),
                  );
                }
              },
            );
          } else {
            // User is not signed in
            return LogIn();
          }
        },
      ),
    );
  }

  Future<String?> getUserRole(String? userId) async {
    if (userId != null) {
      try {
        // Reference to the user document in Firestore
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            await FirebaseFirestore.instance.collection('users').doc(userId).get();

        // Check if the user document exists
        if (userSnapshot.exists) {
          // Get the data map from the user document
          Map<String, dynamic> userData = userSnapshot.data()!;

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
