

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

