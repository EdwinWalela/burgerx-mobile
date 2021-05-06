import 'package:flutter/material.dart';
import '../blocs/login_bloc_provider.dart';

class LoginForm extends StatelessWidget {
  Widget build(BuildContext context) {
    final LoginBloc bloc = LoginBlocProvider.of(context);

    return StreamBuilder(
      stream: bloc.isLoading,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Stack(
            children: [
              !snapshot.data
                  ? Container()
                  : Center(child: CircularProgressIndicator()),
              buildForm(bloc, context)
            ],
          );
        } else {
          return Stack(
            children: [buildForm(bloc, context)],
          );
        }
      },
    );
  }

  Widget buildForm(LoginBloc bloc, BuildContext context) {
    return StreamBuilder(
      stream: bloc.loggedIn,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          // @TODO: redirect to menu page
        } else if (snapshot.hasError) {
          //
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  // duration: Duration(seconds: 4),
                  content: Text(
                    '${snapshot.error}',
                  ),
                ),
              );
            },
          );
        }
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
            buildNewUser(context)
          ],
        );
      },
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

  Widget buildNewUser(BuildContext context) {
    return InkWell(
      child: Text("Don't have an account? Sign up"),
      onTap: () {
        Navigator.pushNamed(context, '/register');
      },
    );
  }
}
