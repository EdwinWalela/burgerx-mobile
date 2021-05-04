import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildNameInput(),
        Container(
          margin: EdgeInsets.only(top: 20),
        ),
        buildEmailInput(),
        Container(
          margin: EdgeInsets.only(top: 20),
        ),
        buildPasswordInput(),
        Container(
          margin: EdgeInsets.only(top: 20),
        ),
        buildPasswordInput(),
        Container(
          margin: EdgeInsets.only(top: 20),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
        ),
        buildRegisterButton(),
        Container(
          margin: EdgeInsets.only(top: 20),
        ),
        buildExistingUser()
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

  Widget buildNameInput() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "John",
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

  Widget buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Register',
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ),
    );
  }

  Widget buildExistingUser() {
    return InkWell(
      child: Text("Already have an account? Sign in"),
      onTap: () {},
    );
  }
}
