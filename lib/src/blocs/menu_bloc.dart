import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';
import '../models/Food_Item.dart';
import '../mixins/validators.dart';

class MenuBloc extends Validators {
  final _repository = Repository();

  // StreamControllers
  final _menu = BehaviorSubject<Future<List<FoodItem>>>();

  // Getters
  Function(Future<List<FoodItem>>) get addItems => _menu.sink.add;
  Stream<Future<List<FoodItem>>> get items => _menu.stream;

  void fetchMenu() {
    final menu = _repository.fetchMenu();
    addItems(menu);
  }

  dispose() {
    _menu.close();
  }
}
