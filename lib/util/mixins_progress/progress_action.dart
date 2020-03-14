import 'package:rxdart/rxdart.dart';

mixin ProgressAction {
  final progressActionCtrl = BehaviorSubject<bool>();

  Function(bool) get inProgressAction => progressActionCtrl.sink.add;

  Stream<bool> get outProgressAction => progressActionCtrl.stream;

  closeProgressAction() {
    progressActionCtrl.close();
  }
}
