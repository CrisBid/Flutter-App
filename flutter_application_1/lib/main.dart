import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'homepage.dart';

void main() => runApp(AppBatman());

class AppBatman extends StatefulWidget {
  @override
  _AppBatmanState createState() => _AppBatmanState();
}

class _AppBatmanState extends State<AppBatman> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App do Batman',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
