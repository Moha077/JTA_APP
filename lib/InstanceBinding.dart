import 'package:get/get.dart';
import 'package:jta/GetXcontroller/firebasecontroller.dart';

import 'GetXcontroller/home_view_model.dart';

class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseController>(() => FirebaseController());
    Get.lazyPut(() => HomeViewModel());
  }
}
