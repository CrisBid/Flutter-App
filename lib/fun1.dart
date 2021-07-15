import 'package:flutter/material.dart';

class Fun1 extends StatefulWidget {
  @override
  _Fun1State createState() => _Fun1State();
}

class _Fun1State extends State<Fun1> {
  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if (_people < 0) {
        _infoText = "Mundo Invertido!";
      } else if (_people <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Corona Virus!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Função 1"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Stack(children: [
          Image.asset(
            "images/restaurant.jpg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Pessoas: $_people",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                          onPressed: () {
                            _changePeople(-1);
                          },
                          child: Text("-1",
                              style: TextStyle(
                                  fontSize: 40.0, color: Colors.white))),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                          onPressed: () {
                            _changePeople(1);
                          },
                          child: Text("+1",
                              style: TextStyle(
                                  fontSize: 40.0, color: Colors.white))),
                    ),
                  ],
                ),
                Text(
                  "$_infoText",
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0,
                  ),
                )
              ])
        ]));
  }
}
