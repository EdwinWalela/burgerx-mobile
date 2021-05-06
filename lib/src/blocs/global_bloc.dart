import 'package:burgers/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/User.dart';
import '../resources/repository.dart';

class GlobalBloc {
  final _repository = Repository();

  // StreamControllers
  final _user = BehaviorSubject<User>();

  // Getters
  Function(User) get addUser => _user.sink.add;
  Stream<User> get user => _user.stream;

  fetchUser() async {
    User user = await _repository.fetchUser();
    addUser(user);
  }

  dispose() {
    _user.close();
  }
}
