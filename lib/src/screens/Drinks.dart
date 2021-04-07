import 'package:flutter/material.dart';
import '../widgets/Item_list.dart';
import '../models/Food_Item.dart';

class Drinks extends StatelessWidget {
  Widget build(BuildContext context) {
    //TODO: Get Items from bloc
    List<FoodItem> _items = [
      FoodItem('https://bit.ly/3wBNaN5', 'Coke', 100, 0, 'd'),
      FoodItem('https://bit.ly/3wBNaN5', 'Coke', 100, 0, 'd'),
      FoodItem('https://bit.ly/3wBNaN5', 'Coke', 100, 0, 'd'),
      FoodItem('https://bit.ly/3wBNaN5', 'Coke', 100, 0, 'd'),
    ];
    return Scaffold(
      body: ItemList(_items),
    );
  }
}
