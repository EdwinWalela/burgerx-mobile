import 'package:flutter/material.dart';
import '../widgets/page_header.dart';
import '../widgets/login_form.dart';
import '../blocs/login_bloc_provider.dart';

class LoginScreen extends StatelessWidget {
  String getGreeting(int hr) {
    if (hr < 12) {
      return "Good Morning.";
    } else if (hr < 16) {
      return "Good Afternoon.";
    } else {
      return "Good Evening.";
    }
  }

  Widget build(BuildContext context) {
    int hour = DateTime.now().hour;
    String greeting = getGreeting(hour);

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
                title: greeting,
                subtitle: "Sign in to continue",
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
              ),
              LoginBlocProvider(
                child: LoginForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
