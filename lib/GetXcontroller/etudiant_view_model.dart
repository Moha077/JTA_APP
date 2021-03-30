import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jta/GetXcontroller/firebasecontroller.dart';
import 'package:jta/models/etudiant.dart';

class EtudiantViewModel extends GetxController {
  List<Etudiant> get etudiant => _etudiant;
  List<Etudiant> _etudiant = [];

  final CollectionReference _etudiantCol =
      FirebaseFirestore.instance.collection('etudiant');

  EtudiantViewModel() {
    getEtudiant();
  }

  getEtudiant() async {
    _etudiantCol.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        _etudiant.add(Etudiant.fromJason(value.docs[i].data()));
        print(_etudiant.length);
      }

      update();
    });
  }
}
