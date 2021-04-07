import 'package:burgers/src/models/Food_Item.dart';
import 'package:burgers/src/widgets/item.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  List<FoodItem> _items;

  ItemList(List<FoodItem> items) {
    _items = items;
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Item(_items[index]);
      },
    );
  }
}
