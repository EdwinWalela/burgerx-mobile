import 'package:burgers/src/blocs/cart_bloc_provider.dart';
import 'package:burgers/src/screens/CreditScreen.dart';
import 'package:burgers/src/screens/Login.dart';
import 'package:burgers/src/screens/Register.dart';
import 'package:flutter/material.dart';
import './screens/MenuTab.dart';
import './screens/Login.dart';
import './screens/Register.dart';
import './screens/Cart.dart';
import './blocs/global_bloc_provider.dart';
import './blocs/menu_bloc_provider.dart';
import './screens/Checkout.dart';
import './screens/Decision.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BurgerX",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/decision': (BuildContext context) => DecisionScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/register': (BuildContext context) => RegisterScreen(),
        '/menu': (BuildContext context) => MenuBlocProvider(
              child: MenuTab(),
            ),
        '/cart': (BuildContext context) => CartBlocProvider(
              child: CartScreen(),
            ),
        '/checkout': (BuildContext context) => CartBlocProvider(
              child: CheckoutScreen(),
            ),
        '/credits': (BuildContext context) => RegisterScreen(),
      },
      home: CreditScreen(),
    );
    // home: CartBlocProvider(
    //   child: CheckoutScreen(),
    // ),
    // home: CartBlocProvider(
    //   child: CartScreen(),
    // ),
    //   home: GlobalBlocProvider(
    //     child: DecisionScreen(),
    //   ),
    // );
  }
}
