import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../blocs/register_bloc_provider.dart';

class RegisterForm extends StatelessWidget {
  Widget build(BuildContext context) {
    final RegisterBloc bloc = RegisterBlocProvider.of(context);

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

  Widget buildForm(RegisterBloc bloc, BuildContext context) {
    return StreamBuilder(
      stream: bloc.registered,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 8),
                action: SnackBarAction(
                  label: "Sign in",
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                content: Text(
                  'Registration Successful',
                ),
              ));
            },
          );
        } else if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 8),
                content: Text(
                  '${snapshot.error}',
                ),
              ));
            },
          );
        }

        return Column(
          children: [
            buildNameInput(bloc),
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
            buildExistingUser(context),
          ],
        );
      },
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

  Widget buildNameInput(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.username,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          onChanged: bloc.changeUsername,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            labelText: "Username",
            hintText: "John",
            errorText: snapshot.error,
          ),
        );
      },
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
            onPressed: !snaphot.hasData ? null : bloc.submit,
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

  Widget buildExistingUser(BuildContext context) {
    return InkWell(
      child: Text("Already have an account? Sign in"),
      onTap: () {
        Navigator.pushNamed(context, '/login');
      },
    );
  }

  Widget buildCircularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
