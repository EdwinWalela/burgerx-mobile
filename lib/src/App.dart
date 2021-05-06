import 'package:burgers/src/screens/Login.dart';
import 'package:burgers/src/screens/Register.dart';
import 'package:flutter/material.dart';
// import './screens/MenuTab/MenuTab.dart';
// import './screens/Login.dart';
// import './screens/Register.dart';
import './screens/Loading.dart';
import './blocs/global_bloc_provider.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = GlobalBlocProvider.of(context);
    bloc.fetchUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: RegisterScreen(),
      // home: LoginScreen(),
      builder: (BuildContext context, Widget child) {
        return StreamBuilder(
          stream: bloc.user,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return RegisterScreen();
            }

            return Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return new MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                );
              },
            );
          },
        );
      },

      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => RegisterScreen(),
        '/login': (BuildContext context) => LoginScreen()
      },
    );
  }
}
