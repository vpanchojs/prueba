import 'dart:convert';

import 'package:prueba/api/http_client.dart';
import 'package:prueba/models/person.dart';
import 'package:prueba/util/bloc/bloc_provider.dart';
import 'package:prueba/util/mixins_progress/progress_action.dart';
import 'package:prueba/util/ui/action_view.dart';
import 'package:prueba/util/validators/validators.dart';
import 'package:rxdart/rxdart.dart';

class BLogin extends BlocBase  with Validators,ProgressAction
{

  final _userCtrl = BehaviorSubject<String>();

  Function(String) get inUser => _userCtrl.sink.add;

  Stream<String> get outUser => _userCtrl.stream.transform(validUser);


  final _passwordCtrl = BehaviorSubject<String>();

  Function(String) get inPassword => _passwordCtrl.sink.add;

  Stream<String> get outPassword => _passwordCtrl.stream.transform(validPassword);

  final _viewCtrl = BehaviorSubject<ActionView>();

  Function(ActionView) get inView => _viewCtrl.sink.add;

  Stream<ActionView> get outview => _viewCtrl.stream;


  Stream<bool> get buttonActionValid =>
      Rx.combineLatest2(
          outUser,
          outPassword,
              (user, password) => true);

  @override
  void dispose() {
    _userCtrl.close();
    _passwordCtrl.close();
    _viewCtrl.close();
  }

  ///Metodo para iniciar sesion
  signIn(){
    inProgressAction(true);
    HttpClient().signIn(_userCtrl.value.trim(), _passwordCtrl.value.trim()).then((response){
      inProgressAction(false);
      if(response.statusCode==200){
        var profile= Person.profile(json.decode(response.body)["perfil"]);
        inView(ActionView()..action=ActionEnum.PUSHDATA..data=profile);
      }else{
        inView(ActionView()..action=ActionEnum.ERROR..message=json.decode(response.body)["message"]);
      }
    }).catchError((error){
      inProgressAction(false);
      inView(ActionView()..action=ActionEnum.ERROR..message=error.toString());
    });
  }

}