import 'package:flutter/material.dart';
import '../widgets/page_header.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
            ),
            PageHeader(
              title: "Welcome,",
              subtitle: "Sign in to continue",
            )
          ],
        ),
      ),
    );
  }
}
