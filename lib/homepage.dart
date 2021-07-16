import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/fun1.dart';
import 'package:flutter_application_1/fun2.dart';
import 'package:flutter_application_1/fun3.dart';
import 'package:flutter_application_1/funesp1.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: (FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Fun1()));
              },
              child: Text("Função 1"),
              color: Colors.black,
              textColor: Colors.white,
            )),
          ),
          Center(
            child: (FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Fun2()));
              },
              child: Text("Função 2"),
              color: Colors.black,
              textColor: Colors.white,
            )),
          ),
          Center(
            child: (FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Fun3()));
              },
              child: Text("Função 3"),
              color: Colors.black,
              textColor: Colors.white,
            )),
          ),
          Center(
            child: (FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Fun3T()));
              },
              child: Text("Função Especial 1"),
              color: Colors.black,
              textColor: Colors.white,
            )),
          ),
        ]));
  }
}
