import 'package:flutter/material.dart';
import '../widgets/page_header.dart';
import '../widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
            ),
            PageHeader(
              title: "Create Account,",
              subtitle: "Sign up to get started",
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
            ),
            RegisterForm()
          ],
        ),
      ),
    );
  }
}
