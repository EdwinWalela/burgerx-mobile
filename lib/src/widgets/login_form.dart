import 'package:flutter/material.dart';
import '../blocs/login_bloc_provider.dart';

class LoginForm extends StatelessWidget {
  Widget build(BuildContext context) {
    final LoginBloc bloc = LoginBlocProvider.of(context);

    return Stack(
      children: [buildForm(bloc, context)],
    );
  }

  Widget buildForm(LoginBloc bloc, BuildContext context) {
    return Column(
      children: [
        buildEmailInput(bloc),
        Container(
          margin: EdgeInsets.only(top: 30),
        ),
        buildPasswordInput(bloc),
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
        buildLoginButton(bloc),
        Container(
          margin: EdgeInsets.only(top: 30),
        ),
        buildNewUser()
      ],
    );
  }

  Widget buildEmailInput(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
              labelText: "Email Address",
              hintText: "john@mail.com",
              errorText: snapshot.hasError ? snapshot.error : null),
        );
      },
    );
  }

  Widget buildPasswordInput(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
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

  Widget buildLoginButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValid,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: snapshot.hasData ? bloc.submit : null,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildNewUser() {
    return InkWell(
      child: Text("Don't have an account? Sign up"),
      onTap: () {},
    );
  }
}
