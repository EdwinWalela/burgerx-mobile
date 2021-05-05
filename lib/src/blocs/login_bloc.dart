import '../models/User.dart';
import 'package:rxdart/rxdart.dart';
import '../mixins/validators.dart';
import '../resources/repository.dart';
import '../resources/auth_api_provider.dart';

class LoginBloc extends Validators {
  final _repository = Repository();

  // StreamControllers
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  final _loginSender = PublishSubject<int>();
  final _loginReciever = BehaviorSubject<bool>();

  LoginBloc() {
    _loginSender.stream.transform(validateLoginStatus).pipe(_loginReciever);
  }

  // Getters
  Function(String) get changeEmail => _email.sink.add;
  Stream<String> get email => _email.stream.transform(validateEmail);

  Function(String) get changePassword => _password.sink.add;
  Stream<String> get password =>
      _password.stream.transform(validatePasswordLogin);

  Stream<bool> get formValid =>
      Rx.combineLatest2(email, password, (a, b) => true);

  Function(int) get changeLoginStatus => _loginSender.sink.add;
  Stream<bool> get loggedIn => _loginReciever.stream;

  submit() async {
    final String email = _email.value;
    final String password = _password.value;

    final User user = User(email: email, password: password);
    final int httpCode = await _repository.authUser(user);

    print(httpCode);
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
