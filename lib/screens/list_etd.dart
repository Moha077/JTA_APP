import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/state_manager.dart';
import 'package:jta/GetXcontroller/etudiant_view_model.dart';
import 'package:jta/GetXcontroller/firebasecontroller.dart';
import 'package:jta/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Etudiants extends GetWidget<FirebaseController> {
  void customLancher(commande) async {
    if (await canLaunch(commande)) {
      await launch(commande);
    } else {
      print("couldnt launch $commande");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 5,
          centerTitle: true,
          title: Text("ESI App"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/esi.png",
            ),
          )),
      body: GetBuilder<EtudiantViewModel>(
        init: EtudiantViewModel(),
        builder: (controller) => controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                children: [
                  Container(
                    height: 50,
                    color: Colors.grey[300],
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Groupe :SIT3",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            "TD/Cours :ASI",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            "heure :14-16",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Etudiant(
                      nom: controller.etudiant[7].nom,
                      prenom: controller.etudiant[7].prenom,
                      email: "hm_hamzaoui@esi.dz"),
                  Etudiant(
                    nom: controller.etudiant[1].nom,
                    prenom: controller.etudiant[1].prenom,
                  ),
                  Etudiant(
                    nom: controller.etudiant[2].nom,
                    prenom: controller.etudiant[2].prenom,
                  ),
                  Etudiant(
                    nom: controller.etudiant[3].nom,
                    prenom: controller.etudiant[3].prenom,
                    email: "gi_douag@esi.dz",
                  ),
                  Etudiant(
                    nom: controller.etudiant[4].nom,
                    prenom: controller.etudiant[4].prenom,
                  ),
                  Etudiant(
                    nom: controller.etudiant[5].nom,
                    prenom: controller.etudiant[5].prenom,
                  ),
                  Etudiant(
                    nom: controller.etudiant[0].nom,
                    prenom: controller.etudiant[0].prenom,
                  ),
                  Etudiant(
                    nom: controller.etudiant[6].nom,
                    prenom: controller.etudiant[6].prenom,
                  ),
                ],
              )),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      title: const Text("List d'absence envoyé ! "),
                      content: Container(
                        height: 65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Divider(
                            //   height: 3,
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/images/valide.png',
                              scale: 10,
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        Center(
                          child: TextButton(
                              onPressed: () {
                                // Map<dynamic, dynamic> data = {"absent ": true};
                                // FirebaseFirestore.instance
                                //     .collection("etudiant")
                                //     .add(data);

                                Navigator.pop(context, 'OK');
                              },
                              child: const Text("OK")),
                        ),
                      ],
                    ));
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Soumettre'),
        ),
      ),
    );
  }
}
