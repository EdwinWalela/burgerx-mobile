import 'package:rxdart/rxdart.dart';
import '../mixins/validators.dart';

class RegisterBloc extends Validators {
  // StreamControllers
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _passwordConfirm = BehaviorSubject<String>();
  final _username = BehaviorSubject<String>();

  // getters

  Function(String) get changeUsername => _username.sink.add;
  Stream<String> get username => _username.stream.transform(validateUserName);

  Function(String) get changeEmail => _email.sink.add; // add to sink
  Stream<String> get email =>
      _email.stream.transform(validateEmail); // listen to stream

  Function(String) get changePassword => _password.sink.add;
  Stream<String> get password => _password.stream.transform(validatePassword);

  Function(String) get changeConfirmPassword => _passwordConfirm.sink.add;
  Stream<String> get confirmPassword =>
      _passwordConfirm.stream.transform(validateConfirmPassword).doOnData(
        (String password) {
          if (0 != _password.value.compareTo(password)) {
            _passwordConfirm.addError("Passwords don't match");
          }
        },
      );

  Stream<bool> get formValid => Rx.combineLatest(
      [email, username, password, confirmPassword], (values) => true);

  dispose() {
    _email.close();
    _username.close();
    _password.close();
    _passwordConfirm.close();
  }
}
