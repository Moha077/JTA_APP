import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:jta/GetXcontroller/firebasecontroller.dart';
import 'package:jta/GetXcontroller/profil_viewu=_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Profil extends StatelessWidget {
  void customLancher(commande) async {
    if (await canLaunch(commande)) {
      await launch(commande);
    } else {
      print("couldnt launch $commande");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilViewModel>(
      init: ProfilViewModel(),
      builder: (controller) => Scaffold(
          body: Container(
        padding: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(
                              'assets/images/man.jpg',
                            )),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 6,
                            spreadRadius: -4,
                            offset: Offset(1, 1), // Shadow position
                          ),
                        ],
                      )),
                  Column(
                    children: [
                      Text(
                        "enseignant1@esi.dz",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Enseignant1",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Maitre de Conférence",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Container(
                  child: FlatButton(
                      onPressed: () {},
                      child: ListTile(
                        title: Text(
                          "Edit Profil",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/images/edit.png',
                          scale: 3,
                        ),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        ),
                      )),
                ),
                Container(
                  child: FlatButton(
                      onPressed: () {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  title: const Text("Mes Modules"),
                                  content: Container(
                                    height: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "ALGO 1                      4h/semaine",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "BDA                            9h/semaine",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "ARCHI 2                     2h/semaine",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text("Cancel")),
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text("OK")),
                                  ],
                                ));
                      },
                      child: ListTile(
                        title: Text(
                          "Mes Modules",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/images/book.png',
                          scale: 20,
                        ),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        ),
                      )),
                ),
                Container(
                  child: FlatButton(
                      onPressed: () {
                        customLancher(
                            "http://esi.dz/edt.html?fbclid=IwAR2PUjKXEXprlBsP82GxrgPwYadskMJLhitKjpVmps7Ho1E3vyW2IP5H5kc");
                      },
                      child: ListTile(
                        title: Text(
                          "Emploi de Temps",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/images/schedule.png',
                          scale: 20,
                        ),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        ),
                      )),
                ),
                SizedBox(
                  height: 200,
                ),
                Container(
                  child: GetBuilder<FirebaseController>(
                    init: FirebaseController(),
                    builder: (controller) => FlatButton(
                        onPressed: () {
                          controller.signOut();
                        },
                        child: ListTile(
                          title: Text(
                            "Se Déconnecter",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Image.asset(
                            'assets/images/logout.png',
                            scale: 15,
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ],
        )),
      )),
    );
  }
}
