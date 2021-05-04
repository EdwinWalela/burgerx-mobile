import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@') &&
        email.contains('.') &&
        email.split('.')[1].length > 1) {
      sink.add(email);
    } else {
      sink.addError("Invalid Email");
    }
  });
}
