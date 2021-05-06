import 'package:burgers/src/screens/Login.dart';
import 'package:burgers/src/screens/Register.dart';
import 'package:flutter/material.dart';
import './screens/MenuTab.dart';
import './screens/Login.dart';
import './screens/Register.dart';
import './blocs/global_bloc_provider.dart';
import './screens/Decision.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/decision': (BuildContext context) => DecisionScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/register': (BuildContext context) => RegisterScreen(),
        '/menu': (BuildContext context) => MenuTab()
      },
      home: GlobalBlocProvider(
        child: DecisionScreen(),
      ),
    );
  }
}
