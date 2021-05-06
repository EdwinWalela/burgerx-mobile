import 'package:flutter/material.dart';
import '../blocs/global_bloc_provider.dart';

class Loading extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = GlobalBlocProvider.of(context);
    bloc.fetchUser();

    return Scaffold(
      body: StreamBuilder(
        stream: bloc.user,
        builder: (BuildContext context, AsyncSnapshot snapsot) {
          if (!snapsot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // Navigator.of(context).pushNamed('/register');
          return Container();
        },
      ),
    );
  }
}
