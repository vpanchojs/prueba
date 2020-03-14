import 'dart:async';

import 'inputs.dart';

class Validators {
  final validUser = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, skin) {
        var message = InputValidates.validInput(value);
        (message == null) ? skin.add(value) : skin.addError(message);
      });

  final validPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, skin) {
        var message = InputValidates.validInput(value);
        (message == null) ? skin.add(value) : skin.addError(message);
      });


}