import 'package:get/get.dart';
import 'package:jta/GetXcontroller/firebasecontroller.dart';

class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseController>(() => FirebaseController());
  }
}
