import 'package:burgers/src/models/Food_Item.dart';
import 'package:burgers/src/widgets/Item_list.dart';
import 'package:flutter/material.dart';

class Burgers extends StatelessWidget {
  Widget build(BuildContext context) {
    //TODO: Get Items from bloc
    List<FoodItem> _items = [
      FoodItem('https://bit.ly/3wzTiVV', 'Beef BBQ Buger', 400, 3.5,
          'beef, BBQ sauce, guacamole'),
    ];
    return Scaffold(
      body: ItemList(_items),
    );
  }
}
