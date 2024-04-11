import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }
  //sign in
  Future<UserCredential> signInWithEmailAndPassword(String email,password) async{
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }
  //sign up
  Future<UserCredential> signUpWithEmailAndPassword(String email,password) async{
    try{
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }
  //reset
  Future<void> sendPasswordResetEmail(String email) async{
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
  //sign out
  Future<void> signOut()async{
    return await _firebaseAuth.signOut();
  }
}