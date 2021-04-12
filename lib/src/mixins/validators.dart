import 'dart:async';
import '../models/Food_Item.dart';

class Validators {
  final validateResponse =
      StreamTransformer<List<FoodItem>, String>.fromHandlers();
}
