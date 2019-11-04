import 'dart:async';

import 'package:crudfirebaseflutter/src/Blocs/Validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<bool> get formValidStream => Observable.combineLatest2(emailStream, passwordStream, (es, ps) => true);

  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);

  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
