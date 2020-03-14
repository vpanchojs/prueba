import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prueba/app/dashboard/page.dart';
import 'package:prueba/resource/strings.dart';
import 'package:prueba/util/bloc/bloc_provider.dart';
import 'package:prueba/util/decorations/curve_footer.dart';

import 'bloc/b_login.dart';

class PageLogin extends StatefulWidget{

  @override
  _PageLoginState createState() => _PageLoginState();

}

class _PageLoginState extends State<PageLogin> {
  BLogin _bLogin;
   final GlobalKey<ScaffoldState> _scaffKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bLogin= BlocProvider.of<BLogin>(context);
    _bLogin.outview.listen((value){
      value.actionExecute(context,_scaffKey,navigationToDashboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffKey,
      body: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(double.maxFinite, double.maxFinite),
            painter: CurveFooter(),
          ),
          decorationTop(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                SizedBox(height:  MediaQuery.of(context).size.height/3),
                labelLogin(),
                SizedBox(height: 16),
                inputUser(),
                SizedBox(height: 8),
                inputPassword(),
                SizedBox(height: 24),
                actionButton()
              ],
            ),
          ),
        ],
      ),
    );
  }

  navigationToDashboard(profile){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => PageDashBoard(person: profile)),
        ModalRoute.withName(""));
  }


/* Widget que componente la vista*/

  labelLogin() {
    return Text("INICIAR SESIÓN", style: TextStyle(fontSize: 20));
  }
  
  
  Widget inputUser() {
    return StreamBuilder(
        stream: _bLogin.outUser,
        builder: (context, snapshot) {
          return TextField(
            onChanged: _bLogin.inUser,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: label_input_user,
              hintText: hint_input_user,
              errorText: snapshot.error,
            ),
            maxLines: 1,
          );
        });
  }


  Widget inputPassword() {
    return StreamBuilder(
        stream: _bLogin.outPassword,
        builder: (context, snapshot) {
          return TextField(
            onChanged: _bLogin.inPassword,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              labelText: label_input_password,
              hintText: hint_input_password,
              errorText: snapshot.error,
            ),
            maxLines: 1,
          );
        });
  }

  Widget actionButton() {
    return StreamBuilder(
      stream: _bLogin.outProgressAction,
      initialData: false,
      builder: (context, snapshot) {
        if (snapshot.data) {
          return Align(
            alignment: FractionalOffset.center,
            child: Container(
              height: 24,
              margin: EdgeInsets.only(right: 8),
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor:
                AlwaysStoppedAnimation<Color>(Colors.yellow[900]),
              ),
            ),
          );
        }
        return buttonSignIn();
      },
    );
  }

  Widget buttonSignIn() {
    return StreamBuilder(
        stream: _bLogin.buttonActionValid,
        builder: (context, snapshot) {
          return Container(
            height: 45,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(24.0),
                  side: BorderSide(color: Colors.yellow[900])
              ),
              child: Text(button_signIn),
              onPressed: snapshot.hasData
                  ? _bLogin.signIn
                  : null,
            ),
          );
        });
  }

  
 decorationTop(){
   return Positioned(
     top: -30,
     right: -70,
     child: Transform.rotate(
       angle: -pi/3.5,
       child: Container(
          height: 270,
          width: 270,
          child: Transform.rotate(angle:pi/3.5,child: Icon(Icons.account_circle,size: 150,color: Colors.white)),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(80.0),gradient: LinearGradient(colors: [Colors.red,Colors.yellow])),
       ),
     ),
   );
  }

 
}