import 'package:burgers/src/models/Food_Item.dart';
import 'package:burgers/src/widgets/item.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final List items;

  ItemList({this.items});

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Item(FoodItem.fromJson(items[index]));
      },
    );
  }
}
