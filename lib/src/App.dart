import 'package:flutter/material.dart';
import './screens/MenuTab/MenuTab.dart';
// import './screens/Login.dart';
// import './screens/Register.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuTab(),
    );
  }
}
