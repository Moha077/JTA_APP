import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jta/GetXcontroller/firebasecontroller.dart';

class Home extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          centerTitle: true,
          title: Text("Liste des étudiants"),
        ),
        body: SingleChildScrollView(
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
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Text(
                        "TD/Cours :ASI",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Text(
                        "heure :14-16",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Etudiant(),
              Etudiant(),
              Etudiant(),
              Etudiant(),
              Etudiant(),
              Etudiant(),
              Etudiant(),
              Etudiant(),
            ],
          ),
        )
        //Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     SizedBox(
        //       height: 30,
        //     ),
        //     Center(
        //       child: Text("super you are connected"),
        //     ),
        //     SizedBox(
        //       height: 30,
        //     ),
        //     RaisedButton(
        //       onPressed: () {
        //         controller.signOut();
        //       },
        //       child: Text("GetOut"),
        //     )
        //   ],
        // ),
        );
  }
}

class Etudiant extends StatelessWidget {
  const Etudiant({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nom : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(
                      height: 2.8,
                    ),
                    Text(
                      "Prénom : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120.0),
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
    );
  }
}
