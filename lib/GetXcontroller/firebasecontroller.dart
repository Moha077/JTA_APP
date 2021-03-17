import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import 'package:jta/screens/home/home.dart';
import 'package:jta/screens/login.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();
  String get user => _firebaseUser.value?.email;
  @override
  // ignore: must_call_super
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void login(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.offAll(Home()))
        .catchError(
            (onError) => Get.snackbar("Error while sign in ", onError.message));
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.offAll(Login());
    } catch (e) {
      Get.snackbar("Verify your connction", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signInAnonym() async {
    try {
      await _auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
