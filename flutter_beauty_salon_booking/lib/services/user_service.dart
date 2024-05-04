import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_beauty_salon_booking/models/users_model.dart';

class UserService {
   final user = FirebaseAuth.instance.currentUser;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  Future <void> addUser(UserModel user){
    return userCollection.add({
      'id': user.id,
      'first_name': user.firstName,
      'last_name': user.lastName,
      'phone_number': user.phoneNumber,
      'role': user.role,
  });
  }
 
Stream<UserModel> getUser(String id) {

    try {
      return FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: id)
          .snapshots()
          .map((snapshot) {
     
          // Access the first document found with the matching 'id' field
          DocumentSnapshot<Map<String, dynamic>> userData = snapshot.docs.first;
          return UserModel(
            id: userData['id'],
            firstName: userData['first_name'],
            lastName: userData['last_name'],
            phoneNumber: userData['phone_number'],
            role: userData['role']
          );
     
      });
    } catch (error) {
      // Handle error
      print(error);
      throw error;
     
    }
 
}



Stream<List<UserModel>> getUsersByListOfIds(List<String> userIds){
  return userCollection.where('id', whereIn: userIds).snapshots().map((snapshot){
    return snapshot.docs.map((doc){
      Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
      return UserModel(firstName: data['first_name'],
      id : data['id'],
      lastName: data['last_name'],
      phoneNumber: data['phone_number'],
      role: data['role']
      );
    }).toList();
  }); 
}
      // Access data from the document
}
