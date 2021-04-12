import 'package:rxdart/rxdart.dart';
import '../models/Food_Item.dart';
import '../resources/menu_api_provider.dart';

class MenuBloc {
  final _menu = BehaviorSubject<FoodItem>();
}
