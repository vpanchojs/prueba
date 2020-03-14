import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/models/person.dart';

class PageDashBoard extends StatelessWidget{
  final Person person;

  const PageDashBoard({Key key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenido"),centerTitle: true),
      body: Text("User ${person.nombre} Correo ${person.email}"),
    );
  }
}