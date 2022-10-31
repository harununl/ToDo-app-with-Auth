import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

// //login

//   Future<User> signIn(String email, String password) async {
//     final User = await _auth.signInWithEmailAndPassword(
//         email: email, password: password);

//     return User.user!;
//   }

//signout
  signOut() async {
    return await _auth.signOut();
  }

// //register
//   Future<User?> signUp(String email, String password) async {
//     try {
//       final user = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);

//       return user.user!;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
}
