import 'package:rxdart/rxdart.dart';
import '../mixins/validators.dart';

class RegisterBloc extends Validators {
  // StreamControllers
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _passwordConfirm = BehaviorSubject<String>();

  // getters
  Function(String) get changeEmail => _email.sink.add; // add to sink
  get email => _email.stream.transform(validateEmail); // listen to stream

  dispose() {
    _email.close();
    _password.close();
    _passwordConfirm.close();
  }
}
