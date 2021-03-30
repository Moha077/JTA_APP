import 'package:cloud_firestore/cloud_firestore.dart';

class EtdService {
  final CollectionReference _etudiantCol =
      FirebaseFirestore.instance.collection('etudiant');
  Future<List<QueryDocumentSnapshot>> getEtud() async {
    var value = await _etudiantCol.get();

    return value.docs;
  }
}
