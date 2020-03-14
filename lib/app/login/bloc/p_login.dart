import 'package:flutter/material.dart';
import 'package:prueba/util/bloc/bloc_provider.dart';

import '../page.dart';
import 'b_login.dart';

class PLogin extends StatefulWidget{

  @override
  _PLoginState createState() => _PLoginState();

}

class _PLoginState extends State<PLogin> {
  BLogin _bLogin;


  @override
  void initState() {
    super.initState();
    _bLogin= new BLogin();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(child: PageLogin(), bloc: _bLogin);
  }

}