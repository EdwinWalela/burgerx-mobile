import 'package:flutter/material.dart';
import '../../models/Food_Item.dart';
import '../../widgets/Item_list.dart';

class Meals extends StatelessWidget {
  Widget build(BuildContext context) {
    //TODO: Get Items from bloc
    List<FoodItem> _items = [
      FoodItem('https://bit.ly/3fMOerp', 'Family Meal', 850, 4,
          'Family fries, beef burger, soda'),
      FoodItem('https://bit.ly/3fMOerp', 'Family Meal', 850, 4,
          'Family fries, beef burger, soda'),
      FoodItem('https://bit.ly/3fMOerp', 'Family Meal', 850, 4,
          'Family fries, beef burger, soda'),
      FoodItem('https://bit.ly/3fMOerp', 'Family Meal', 850, 4,
          'Family fries, beef burger, soda'),
      FoodItem('https://bit.ly/3fMOerp', 'Family Meal', 850, 4,
          'Family fries, beef burger, soda'),
      FoodItem('https://bit.ly/3fMOerp', 'Family Meal', 850, 4,
          'Family fries, beef burger, soda'),
    ];
    return Scaffold(
      body: ItemList(_items),
    );
  }
}
