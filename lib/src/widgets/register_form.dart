import 'package:flutter/material.dart';
import '../blocs/register_bloc_provider.dart';

class RegisterForm extends StatelessWidget {
  Widget build(BuildContext context) {
    final RegisterBloc bloc = RegisterBlocProvider.of(context);
    return Column(
      children: [
        buildNameInput(),
        Container(
          margin: EdgeInsets.only(top: 20),
        ),
        buildEmailInput(bloc),
        Container(
          margin: EdgeInsets.only(top: 20),
        ),
        buildPasswordInput(bloc),
        Container(
          margin: EdgeInsets.only(top: 20),
        ),
        buildConfirmPasswordInput(bloc),
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

  Widget buildEmailInput(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
            labelText: "Email Address",
            hintText: "john@mail.com",
            errorText: snapshot.error,
          ),
        );
      },
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

  Widget buildPasswordInput(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget buildConfirmPasswordInput(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.confirmPassword,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeConfirmPassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            errorText: snapshot.error,
          ),
        );
      },
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
