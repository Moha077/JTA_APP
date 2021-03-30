import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jta/GetXcontroller/firebasecontroller.dart';
import 'package:jta/screens/home.dart';
import 'package:jta/screens/login.dart';
import 'package:jta/screens/profil.dart';

import 'GetXcontroller/controlle_view_model.dart';

class IsSignedIn extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<FirebaseController>().user != null)
          ? GetBuilder<ControlleViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            )
          : Login();
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlleViewModel>(
      init: ControlleViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text('Accueil',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
              label: '',
              icon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Icon(Icons.library_books))),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("Profil",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Icon(Icons.person_outline_sharp),
            ),
            //fit: BoxFit.contain,
            //width: 20,
          ),
        ],
        currentIndex: controller.navigatoreValue,
        onTap: (index) {
          controller.changeSelectedNavigator(index);

          // if (index == 1) {
          //   Get.to(Profil());
          // }
        },
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
