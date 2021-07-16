import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Map> getData() async {
  String Cidade = "São Gotardo,MG";
  var request =
      "https://api.hgbrasil.com/weather?key=49adb3f3&city_name=$Cidade";
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Fun3T extends StatefulWidget {
  @override
  _Fun3TState createState() => _Fun3TState();
}

class _Fun3TState extends State<Fun3T> {
  int Temp;
  double Tamanho1;
  String City = "";
  String Desc = "";
  String pre = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("BatClima"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                    child: Text(
                  "Carregando Dados...",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ));
              default:
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    "Erro ao Carregar Dados :(",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ));
                } else {
                  Temp = snapshot.data["results"]["temp"];
                  City = snapshot.data["results"]["city"];
                  Desc = snapshot.data["results"]["description"];

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: 150.0,
                        ),
                        Divider(),
                        Text(
                          "Cidade",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          "$City",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                        Divider(),
                        Text(
                          "Condição",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          "$Desc",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                        Divider(),
                        Text(
                          "Temperatura",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          "$Tempº",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                        buildText(City, pre, 25.0)
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }
}

Widget buildText(String Textinho, String prefix, double Tamanho1) {
  return Text(
    "$Textinho $prefix",
    style: TextStyle(
      color: Colors.white,
      fontSize: Tamanho1,
    ),
  );
}
