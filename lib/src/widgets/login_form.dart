import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildEmailInput(),
        Container(
          margin: EdgeInsets.only(top: 30),
        ),
        buildPasswordInput(),
        Container(
          margin: EdgeInsets.only(top: 30),
        ),
        Align(
          child: buildForgotPassword(),
          alignment: Alignment.centerRight,
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
        ),
        buildLoginButton(),
        Container(
          margin: EdgeInsets.only(top: 40),
        ),
        buildNewUser()
      ],
    );
  }

  Widget buildEmailInput() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Email Address",
        hintText: "john@mail.com",
      ),
    );
  }

  Widget buildPasswordInput() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
      ),
    );
  }

  Widget buildForgotPassword() {
    return InkWell(
      child: Text('Forgot Password?'),
      onTap: () {},
    );
  }

  Widget buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  Widget buildNewUser() {
    return InkWell(
      child: Text("Don't have an account? Sign up"),
      onTap: () {},
    );
  }
}
