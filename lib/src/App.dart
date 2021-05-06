import 'package:burgers/src/screens/Login.dart';
import 'package:flutter/material.dart';
// import './screens/MenuTab/MenuTab.dart';
// import './screens/Login.dart';
// import './screens/Register.dart';
import './screens/Loading.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: RegisterScreen(),
        // home: LoginScreen(),
        home: Loading());
  }
}
