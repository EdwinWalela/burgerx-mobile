import 'package:flutter/material.dart';
import '../widgets/page_header.dart';
import '../widgets/register_form.dart';
import '../blocs/register_bloc_provider.dart';

class RegisterScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
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
            RegisterBlocProvider(
              child: RegisterForm(),
            )
          ],
        ),
      ),
    ));
  }
}
