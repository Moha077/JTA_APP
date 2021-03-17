// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// class AuthController extends GetxController {
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   Rx<User> _firebaseUser = Rx<User>();

//   User get user => _firebaseUser.value;

//   @override
//   void onInit() {
//     _firebaseUser.bindStream(_auth.onAuthStateChanged);
//   }
// }
