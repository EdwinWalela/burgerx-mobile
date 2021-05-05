import 'package:flutter/material.dart';
import './login_bloc.dart';
export './login_bloc.dart';

class LoginBlocProvider extends InheritedWidget {
  bool updateShouldNotify(_) => true;

  final bloc = LoginBloc();

  LoginBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LoginBlocProvider>())
        .bloc;
  }
}
