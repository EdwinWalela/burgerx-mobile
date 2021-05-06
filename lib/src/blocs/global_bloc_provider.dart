import 'package:flutter/material.dart';
import './global_bloc.dart';
export './global_bloc.dart';

class GlobalBlocProvider extends InheritedWidget {
  bool updateShouldNotify(_) => true;

  final bloc = GlobalBloc();

  GlobalBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  static GlobalBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<GlobalBlocProvider>())
        .bloc;
  }
}
