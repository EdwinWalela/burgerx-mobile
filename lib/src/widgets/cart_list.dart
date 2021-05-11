import 'package:burgers/src/models/Food_Item.dart';
import 'cart_item.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  final List items;

  CartList({this.items});

  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CartItem(item: items[index]),
            Divider(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}
