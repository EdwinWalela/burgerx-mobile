import 'package:burgers/src/screens/Login.dart';
import 'package:flutter/material.dart';
// import './screens/MenuTab/MenuTab.dart';
// import './screens/Login.dart';
// import './screens/Register.dart';
import './screens/Loading.dart';
import './blocs/global_bloc_provider.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return GlobalBlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: RegisterScreen(),
        // home: LoginScreen(),
        home: Loading(),
      ),
    );
  }
}
