import 'package:flutter/material.dart';
import '../blocs/global_bloc_provider.dart';

class Loading extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = GlobalBlocProvider.of(context);
    bloc.fetchUser();
    return Scaffold(
      body: Center(
        child: Text("Loading..."),
      ),
    );
  }
}
