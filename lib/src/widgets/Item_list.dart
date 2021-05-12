import 'package:burgers/src/blocs/cart_bloc_provider.dart';
import 'package:burgers/src/models/Food_Item.dart';
import 'package:burgers/src/widgets/item.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final List items;

  ItemList({this.items});

  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.no_food_outlined,
              size: 50,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
            ),
            Text(
              "No items available",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CartBlocProvider(
          child: Item(FoodItem.fromJson(items[index])),
        );
      },
    );
  }
}
