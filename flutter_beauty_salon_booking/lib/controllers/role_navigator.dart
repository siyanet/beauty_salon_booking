import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class RoleNavigator{
 // final UserCredential userCredential;
//  RoleNavigator(this.userCredential);
  void navigate(context,UserCredential userCredential) async{
   try {
    Query<Map<String, dynamic>> userRef = FirebaseFirestore.instance.collection('users').where('id', isEqualTo: userCredential.user!.uid);

    // Reference to the user document in Firestore
  QuerySnapshot<Map<String, dynamic>> userSnapshot = await userRef.get();



    // Check if the user document exists
    if (!userSnapshot.docs.isEmpty) {
      DocumentSnapshot<Map<String, dynamic>> userData = userSnapshot.docs.first;
      // Get the data map from the user document


      // Retrieve and return the "role" field
      String role = userData['role'];
      if (role == "Manager"){
        Navigator.pop(context);
        Navigator.pushNamed(context,"/manager_home_page");
      }
      else if(role == "Customer"){
        Navigator.pop(context);
        Navigator.pushNamed(context, "/customer_home_page");
      }
      else{
          Navigator.pop(context);
        Navigator.pushNamed(context, "/login_page");
      }
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

}}