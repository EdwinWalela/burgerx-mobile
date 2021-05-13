import 'package:burgers/src/blocs/cart_bloc.dart';
import 'package:burgers/src/models/Cart_Item.dart';
import 'package:burgers/src/models/Food_Item.dart';
import 'cart_item.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  final List items;
  final CartBloc bloc;

  CartList({this.items, this.bloc});

  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CartItemCard(item: CartItem.fromDB(items[index]), bloc: bloc),
            Divider(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}
