import 'package:burgers/src/blocs/payment_bloc.dart';
export 'package:burgers/src/blocs/payment_bloc.dart';
import 'package:flutter/cupertino.dart';

class PaymentBlocProvider extends InheritedWidget {
  bool updateShouldNotify(_) => true;
  final bloc = PaymentBloc();

  PaymentBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  static PaymentBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<PaymentBlocProvider>())
        .bloc;
  }
}
