import 'package:burgers/src/models/User.dart';
import 'package:rxdart/rxdart.dart';
import '../mixins/validators.dart';
import '../resources/repository.dart';

class RegisterBloc extends Validators {
  final _repository = Repository();

  // StreamControllers
  final _email = BehaviorSubject<String>();

  final _password = BehaviorSubject<String>();

  final _passwordConfirm = BehaviorSubject<String>();

  final _username = BehaviorSubject<String>();

  final _hasRegisteredSender = PublishSubject<int>();
  final _hasRegistered = BehaviorSubject<bool>();

  final _isLoading = BehaviorSubject<bool>();

  RegisterBloc() {
    _hasRegisteredSender.stream
        .transform(validateRegistrationStatus)
        .pipe(_hasRegistered);
  }

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

  Function(int) get changeRegistered => _hasRegisteredSender.sink.add;
  Stream<bool> get registered => _hasRegistered.stream;

  Function(bool) get changeLoading => _isLoading.sink.add;
  Stream<bool> get isLoading =>
      _isLoading.stream.transform(validateLoadingStatus);

  submit() async {
    //@TODO: add 'true' to is_loading stream
    changeLoading(true);

    final userEmail = _email.value.trim();
    final userPassword = _password.value;
    final userName = _username.value;

    final User user =
        User(email: userEmail, password: userPassword, username: userName);

    final httpCode = await _repository.registerUser(user);

    changeRegistered(httpCode); // add response to sink

    changeLoading(false);
  }

  dispose() {
    _email.close();
    _username.close();
    _password.close();
    _passwordConfirm.close();
    _hasRegistered.close();
    _hasRegisteredSender.close();
    _isLoading.close();
  }
}
