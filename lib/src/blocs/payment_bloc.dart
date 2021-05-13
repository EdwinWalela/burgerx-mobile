import 'package:rxdart/rxdart.dart';

class PaymentBloc {
  final _method = BehaviorSubject<String>();

  Function(String) get changeMethod => _method.sink.add;
  Stream<String> get method => _method.stream;

  dispose() {
    _method.close();
  }
}
