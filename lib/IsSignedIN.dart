import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jta/GetXcontroller/firebasecontroller.dart';
import 'package:jta/screens/home/home.dart';
import 'package:jta/screens/login.dart';

class IsSignedIn extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<FirebaseController>().user != null) ? Login() : Home();
    });
  }
}
