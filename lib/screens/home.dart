import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jta/GetXcontroller/firebasecontroller.dart';
import 'package:jta/GetXcontroller/controlle_view_model.dart';
import 'package:jta/screens/list_etd.dart';
import 'package:jta/screens/profil.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends GetWidget<FirebaseController> {
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
        body: Column(
          children: [
            new Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            Container(
              width: double.infinity,
              color: Colors.blue[400],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Prochaine Séance",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("SIL 2",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        Row(
                          children: [
                            Icon(Icons.timer),
                            SizedBox(
                              width: 5,
                            ),
                            Text("00:55:23")
                          ],
                        ),
                      ],
                    ),
                    Text("commance à : 10:15 AM",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text("",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Salle : 25",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () {
                            Get.to(Etudiants());
                          },
                          child: Icon(
                            Icons.navigate_next_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 6,
                    spreadRadius: -4,
                    offset: Offset(1, 1), // Shadow position
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              color: Colors.blue[400],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Groupes",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    EntryItem(data[index]),
                itemCount: data.length,
              ),
            ),
          ],
        ));
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// Data to display.
const List<Entry> data = <Entry>[
  Entry(
    '1CPI',
    <Entry>[
      Entry('GP1'),
      Entry('GP3'),
      Entry('GP4'),
      Entry('GP6'),
    ],
  ),
  Entry(
    '2CPI',
    <Entry>[
      Entry('GP2'),
      Entry('GP5'),
      Entry('GP6'),
      Entry('GP7'),
    ],
  ),
  Entry(
    '1CS',
    <Entry>[
      Entry('GP6'),
      Entry('GP8'),
      Entry('GP9'),
    ],
  ),
  Entry(
    '2CS',
    <Entry>[
      Entry(
        'SIQ',
        <Entry>[
          Entry('SIQ1'),
          Entry('SIQ3'),
        ],
      ),
      Entry(
        'SIT',
        <Entry>[
          Entry('SIT1'),
          Entry('SIT3'),
        ],
      ),
      Entry(
        'SIL',
        <Entry>[
          Entry('SIL2'),
        ],
      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return ListTile(
        title: Text(root.title, style: TextStyle(fontWeight: FontWeight.w100)),
        onTap: () {
          print("taped");
          Get.to(Etudiants());
        },
      );

    return ExpansionTile(
      backgroundColor: Colors.blue[100],
      key: PageStorageKey<Entry>(root),
      title: Text(root.title, style: TextStyle(fontWeight: FontWeight.bold)),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class Etudiant extends StatelessWidget {
  final String nom;
  final String prenom;
  final String email;
  final bool absent;

  const Etudiant({
    Key key,
    this.nom,
    this.prenom,
    this.email,
    this.absent,
  }) : super(key: key);
  void customLancher(commande) async {
    if (await canLaunch(commande)) {
      await launch(commande);
    } else {
      print("couldnt launch $commande");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () {
          customLancher(
              'mailto:$email?subject=test%20subject&body=test%20body');
        },
        child: Container(
            margin: EdgeInsets.all(5),
            width: 360,
            height: 65,
            decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                )),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Nom: ",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "$nom",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.8,
                        ),
                        Row(
                          children: [
                            Text(
                              "Prénom: ",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "$prenom",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0, right: 10),
                  child: ValueBuilder<bool>(
                    initialValue: false,
                    builder: (isChecked, updateFn) => Switch(
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                      value: isChecked,
                      onChanged: (newValue) => updateFn(newValue),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
