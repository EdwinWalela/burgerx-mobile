import 'package:flutter/material.dart';
import './MenuTab.dart';
import './Login.dart';
import '../blocs/global_bloc_provider.dart';
import '../blocs/menu_bloc_provider.dart';

class DecisionScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = GlobalBlocProvider.of(context);
    bloc.fetchUser();
    // Fetch Menu
    return StreamBuilder(
      stream: bloc.user,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            _redirect(
              context,
              MenuBlocProvider(
                child: MenuTab(),
              ),
            );
          } else {
            _redirect(context, LoginScreen());
          }
        }
        if (snapshot.hasError) {
          _redirect(context, LoginScreen());
        }

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  void _redirect(BuildContext context, Widget screen) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        MaterialPageRoute newRoute =
            MaterialPageRoute(builder: (BuildContext context) => screen);

        Navigator.of(context)
            .pushAndRemoveUntil(newRoute, ModalRoute.withName('/decision'));
      },
    );
  }
}
