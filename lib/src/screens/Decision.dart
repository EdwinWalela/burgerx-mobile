import 'package:flutter/material.dart';
import './MenuTab.dart';
import './Login.dart';
import '../blocs/global_bloc_provider.dart';

class DecisionScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = GlobalBlocProvider.of(context);
    bloc.fetchUser();

    return StreamBuilder(
      stream: bloc.user,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final result = snapshot.data;

        if (result != null) {
          _redirect(context, MenuTab());
        } else {
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
