import 'package:flutter/material.dart';

/*
* Clase para comunicacion de acciones de exito o error hacia la vista
* */
class ActionView {
  String message; //Mensaje
  ActionEnum action; //indica que tipo de accion se ejecutara
  dynamic data; // otro conjunto de valores

  actionExecute(BuildContext context, [GlobalKey<ScaffoldState> scaffoldKey,
    dynamic navigation]) {
    switch (action) {
      case ActionEnum.PUSHDATA:
        navigation(data);
        break;
      case ActionEnum.PUSH:
        navigation();
        break;
      case ActionEnum.POP:
        Navigator.pop(context);
        break;
      case ActionEnum.ERROR:
        if (scaffoldKey != null) {
          if (message != "") showSnackBar(message, scaffoldKey);
        } else {
          if (message != "")
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(message.toString())));
        }
        break;
      case ActionEnum.SUCCESS:
        if (scaffoldKey != null) {
          if (message != "") showSnackBar(message, scaffoldKey);
        } else {
          if (message != "")
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(message.toString())));
        }
        break;
      case ActionEnum.POPDATA:
        Navigator.pop(context, data);
        break;
    }
  }

  static showSnackBar(String msg, GlobalKey<ScaffoldState> scaffoldKey) {
    try{
      scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(msg),
        duration: new Duration(seconds: 5),
      ));
    }catch(e){

    }
  }

}

enum ActionEnum { PUSH, POP, ERROR, SUCCESS, POPDATA,PUSHDATA }