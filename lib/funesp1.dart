import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Fun3T extends StatefulWidget {
  @override
  _Fun3TState createState() => _Fun3TState();
}

class _Fun3TState extends State<Fun3T> {
  TextEditingController cityController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus Dados";

  void _resetFields() {
    cityController.text = "";
    setState(() {
      Vari = 0;
      _infoText = "Informe seus Dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void pesquisar() {
    setState(() {
      Cidade = cityController.text;
      Vari = 1;
    });
  }

  Future<Map> getData() async {
    var request =
        "https://api.hgbrasil.com/weather?key=70dcfc99&city_name=$Cidade";
    http.Response response = await http.get(request);
    return json.decode(response.body);
  }

  int Temp, Vari = 0;
  double Tamanho1;
  String City = "";
  String Cidade = "";
  String Desc = "";
  String pre = "";
  String Data = "";
  String Hora = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("BatClima"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
        ],
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
                } else if (Vari == 0) {
                  return SingleChildScrollView(
                      padding: EdgeInsets.all(10.0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Icon(
                                Icons.cloud,
                                color: Colors.white,
                                size: 150.0,
                              ),
                              Divider(),
                              buildText("Qual Cidade?", pre, 30.0),
                              Divider(),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.white),
                                  suffixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(),
                                ),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25.0),
                                textAlign: TextAlign.center,
                                controller: cityController,
                                // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Insira a Cidade";
                                  }
                                },
                              ),
                              Divider(),
                              RaisedButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    pesquisar();
                                  }
                                },
                                child: Text("Pesquisar",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25.0)),
                                color: Colors.blue,
                              ),
                            ],
                          )));
                } else {
                  Temp = snapshot.data["results"]["temp"];
                  City = snapshot.data["results"]["city"];
                  Desc = snapshot.data["results"]["description"];
                  Hora = snapshot.data["results"]["time"];
                  Data = snapshot.data["results"]["date"];

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
                        buildText("Resultado", pre, 30.0),
                        Divider(),
                        buildText(City, pre, 25.0),
                        Divider(),
                        buildText(Desc, pre, 20.0),
                        Divider(),
                        Text(
                          "$Tempº",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                        Divider(),
                        buildText("Atualizado as:", pre, 20.0),
                        buildText(Hora, pre, 15.0),
                        buildText(Data, pre, 15.0),
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
