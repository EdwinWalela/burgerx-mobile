import 'package:flutter/material.dart';
import '../widgets/Item_list.dart';
import '../models/Food_Item.dart';

class Drinks extends StatelessWidget {
  Widget build(BuildContext context) {
    //TODO: Get Items from bloc
    List<FoodItem> _items = [
      FoodItem('https://bit.ly/3wBNaN5', 'Coke', 100, 0, '300ml'),
      FoodItem('https://bit.ly/3wBNaN5', 'Coke', 100, 0, '500ml'),
      FoodItem('https://bit.ly/3wBNaN5', 'Coke', 100, 0, '1 Liter'),
      FoodItem('https://bit.ly/3wBNaN5', 'Coke', 100, 0, '250ml'),
    ];
    return Scaffold(
      body: ItemList(_items),
    );
  }
}
