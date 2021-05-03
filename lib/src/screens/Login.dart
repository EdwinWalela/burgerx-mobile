import 'package:flutter/material.dart';
import '../widgets/page_header.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PageHeader(
            title: "Welcome,",
            subtitle: "Sign in to continue",
          )
        ],
      ),
    );
  }
}
