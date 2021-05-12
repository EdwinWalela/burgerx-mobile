import 'package:burgers/src/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';
export 'package:burgers/src/blocs/cart_bloc.dart';

class CartBlocProvider extends InheritedWidget {
  bool updateShouldNotify(_) => true;

  final bloc = CartBloc();

  CartBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  static CartBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CartBlocProvider>())
        .bloc;
  }
}
