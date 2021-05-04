import 'package:flutter/material.dart';
import './register_bloc.dart';
export './register_bloc.dart';

class RegisterBlocProvider extends InheritedWidget {
  bool updateShouldNotify(_) => true;
  final bloc = RegisterBloc();

  RegisterBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  static RegisterBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<RegisterBlocProvider>())
        .bloc;
  }
}
