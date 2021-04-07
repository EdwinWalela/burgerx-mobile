import 'package:burgers/src/models/Food_Item.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  FoodItem _item;

  Item(FoodItem item) {
    _item = item;
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          thumbnail(_item.thumb),
        ],
      ),
    );
  }

  Widget thumbnail(thumb) {
    return Image.network(
      thumb,
      width: 150,
      height: 150,
    );
  }
}
