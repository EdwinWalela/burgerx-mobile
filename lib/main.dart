import 'package:flutter/material.dart';
import './src/App.dart';
import './src/blocs/global_bloc_provider.dart';

void main() {
  runApp(GlobalBlocProvider(
    child: App(),
  ));
}
