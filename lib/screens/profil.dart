import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:jta/GetXcontroller/profil_viewu=_model.dart';

class Profil extends StatelessWidget {
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
                              image: AssetImage('assets/images/twitter.png')))),
                  Column(
                    children: [
                      Text(
                        "Email@esi.dz",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Enseignient",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
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
                      'assets/images/twitter.png',
                      scale: 20,
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.black,
                    ),
                  )),
            )
          ],
        )),
      )),
    );
  }
}
