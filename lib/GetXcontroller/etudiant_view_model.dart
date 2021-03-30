import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jta/GetXcontroller/firebasecontroller.dart';
import 'package:jta/models/etudiant.dart';
import 'package:jta/services/etudService.dart';

class EtudiantViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<Etudiant> get etudiant => _etudiant;
  List<Etudiant> _etudiant = [];

  EtudiantViewModel() {
    getEtudiant();
  }

  getEtudiant() async {
    _loading.value = true;
    EtdService().getEtud().then((value) {
      for (int i = 0; i < value.length; i++) {
        _etudiant.add(Etudiant.fromJason(value[i].data()));
        print(_etudiant.length);
        _loading.value = false;
        print("hello"); //for test the connection
        print(_etudiant[0].nom);
      }

      update();
    });
  }
}
