import 'package:flutter/material.dart';
import './menu_bloc.dart';
export './menu_bloc.dart';

class MenuBlocProvider extends InheritedWidget {
  bool updateShouldNotify(_) => true;

  final bloc = MenuBloc();

  MenuBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  static MenuBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<MenuBlocProvider>())
        .bloc;
  }
}
