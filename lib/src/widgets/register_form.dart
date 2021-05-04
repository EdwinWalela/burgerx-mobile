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
        buildRegisterButton(bloc),
        Container(
          margin: EdgeInsets.only(top: 10),
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
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
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
        prefixIcon: Icon(Icons.person),
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
            prefixIcon: Icon(Icons.lock),
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
            prefixIcon: Icon(Icons.lock),
            labelText: "Confirm Password",
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

  Widget buildRegisterButton(RegisterBloc bloc) {
    return SizedBox(
      width: double.infinity,
      child: StreamBuilder(
        stream: bloc.formValid,
        builder: (BuildContext context, AsyncSnapshot<bool> snaphot) {
          return ElevatedButton(
            onPressed: !snaphot.hasData ? null : () {},
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          );
        },
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
