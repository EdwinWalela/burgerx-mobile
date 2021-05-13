import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';
import '../models/Food_Item.dart';
import '../mixins/validators.dart';

class MenuBloc extends Validators {
  final _repository = Repository();

  // StreamControllers
  final _menu = BehaviorSubject<List>();

  // Getters
  Function(List) get addItems => _menu.sink.add;
  Stream<List> get items => _menu.stream.transform(responseValidator);

  void fetchMenu() async {
    final menu = await _repository.fetchMenu();

    addItems(menu);
  }

  dispose() {
    _menu.close();
  }
}
