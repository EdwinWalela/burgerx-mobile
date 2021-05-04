import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@') &&
          email.contains('.') &&
          email.split('.')[1].length > 1) {
        sink.add(email);
      } else {
        sink.addError("Invalid Email");
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 5) {
        sink.add(password);
      } else {
        sink.addError("Password needs to be atleast 6 characters long");
      }
    },
  );
}
