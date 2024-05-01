


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
  // Stream<usermodel> getUser(String id){
  //   Query userGetQuery = userCollection.where('id' ,isEqualTo: id);
  //   return userGetQuery.snapshots().map((snapshot){
  //       if (snapshot.docs.isNotEmpty){

  //         DocumentSnapshot<Map<String, dynamic>> userDocument = snapshot.docs.first;

  //  String userid =  userDocument.data()['id'];
  //  String userName = userDocument.data()['FirstName'];
  //  usermodel user = usermodel({
  //   'id': userId,
  //   'name': userName,

  //  }
  //  );
  //  }});}
    
// Future<usermodel?> getUser(String ?id) async{
//   if(id != null){
//     try {
//   // Query userGetQuery = userCollection.where('id', isEqualTo: id);
//      QuerySnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance
//     .collection('users')
//     .where('id', isEqualTo: id)
//     .get();


//     if (userSnapshot.docs.isNotEmpty) {
//       // Access the first document found with the matching 'id' field
//       DocumentSnapshot<Map<String,dynamic>> userData = userSnapshot.docs.first;
//       return  usermodel(
//         {
//           'id': userData['id']
//         }
//       );}
//   }
//   catch (error){

//   }}}

// Future<usermodel?> getUser(String? id) async {
//   if (id != null) {
//     try {
//       QuerySnapshot<Map<String, dynamic>> userSnapshot =
//           await FirebaseFirestore.instance
//               .collection('users')
//               .where('id', isEqualTo: id)
//               .get();

//       if (userSnapshot.docs.isNotEmpty) {
//         // Access the first document found with the matching 'id' field
//         DocumentSnapshot<Map<String, dynamic>> userData = userSnapshot.docs.first;
//         String name = userData['name'];
//         String idt = userData['id'];
//         return usermodel(
//           id: userData['id'],
//           firstName: userData['name'],
//           lastName: userData['last_name'],
//           phoneNumber: userData['phonenumber'],
//           role: userData['role']

//         );
//       } else {
//         // Return null if no document with the specified 'id' is found
//         return null;
//       }
//     } catch (error) {
//       // Handle error
//       print(error);
//       return null;
//     }
//   } else {
//     // Handle the case where 'id' is null
//     return null;
//   }
// }

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
