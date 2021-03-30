import 'package:get/get.dart';
import 'package:jta/GetXcontroller/firebasecontroller.dart';

import 'GetXcontroller/controlle_view_model.dart';
import 'GetXcontroller/etudiant_view_model.dart';

class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseController>(() => FirebaseController());
    Get.lazyPut(() => ControlleViewModel());
    Get.lazyPut(() => EtudiantViewModel());
  }
}
