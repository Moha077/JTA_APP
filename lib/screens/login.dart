import 'package:flutter/material.dart';
import 'package:jta/GetXcontroller/firebasecontroller.dart';
import 'package:jta/components/responsive_screen.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class Login extends GetWidget<FirebaseController> {
  dynamic ss;
  // final AuthService _auth = AuthService();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();
  Screen size;
  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xfff2f3f7),
          body: Stack(
            children: <Widget>[
              Container(
                height: size.heightPercent(62),
                // MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff2470c7),
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(30),
                        bottomRight: const Radius.circular(30),
                      )),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildlogo(),
                      SizedBox(height: 45),
                      _buildCountainer(),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget _buildlogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          //
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: [
              Text(
                "ESI APP",
                style: TextStyle(
                    fontSize: size.getSizeInPx(30),
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                width: 5,
              ),
              Image.asset(
                "assets/images/esi.png",
                scale: 8,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmailRow() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(25),
          child: TextField(
            controller: _mailController,
            decoration: InputDecoration(
                icon: new Icon(
                  Icons.person,
                  color: Color(0xff2470c7),
                ),
                filled: true,
                //     fillColor: Color(0xFF1C2341),
                hintText: "Adresse mail",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)))),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(25),
          child: TextField(
            controller: _passWordController,
            obscureText: true,
            decoration: InputDecoration(
                filled: true,
                icon: new Icon(
                  Icons.lock,
                  color: Color(0xff2470c7),
                ),
                //     fillColor: Color(0xFF1C2341),

                hintText: "Mot de pass",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)))),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(10),
                onPressed: () async {
                  print("Login Clicked Event");
                  _login();
                },
                color: Color(0xff2470c7),
                child: Container(
                  width: 150,
                  alignment: Alignment.center,
                  child: Text("LOGIN",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ))),
      ],
    );
  }

  // ignore: unused_element
  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
        title: const Text('Popup example'),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(ss.toString()),
          ],
        ));
  }

  Widget _buildCountainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          child: Container(
            //I use resposive class for getting this --
            height: size.heightPercent(50),
            // MediaQuery.of(context).size.height * 0.55,
            width: size.widthPercent(85),
            // MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Text("Bienvenu sur ESi APP",
                              style: TextStyle(fontSize: size.getSizeInPx(20)
                                  //  MediaQuery.of(context).size.height / 30
                                  )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 5),
                    child: Text(
                        "Saiser votre information de conexion Pour acceder a votre espace",
                        style: TextStyle(fontSize: size.getSizeInPx(10)
                            // MediaQuery.of(context).size.height / 60

                            )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildEmailRow(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void _login() {
    controller.login(_mailController.text, _passWordController.text);
  }
}
