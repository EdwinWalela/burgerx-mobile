import 'package:burgers/src/models/Food_Item.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  FoodItem _item;

  Item(FoodItem item) {
    _item = item;
  }
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          thumbnail(_item.thumb),
          detailsColumn(),
        ],
      ),
    );
  }

  Widget thumbnail(String thumb) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        thumb,
        width: 150,
        height: 150,
      ),
    );
  }

  Widget detailsColumn() {
    return Column(
      children: [
        title('title'),
        stars(3.5),
        price(550),
        addToCartBtn(),
      ],
    );
  }

  Widget addToCartBtn() {
    return Text('Add to Cart');
  }

  Widget stars(double value) {
    return Text('$value');
  }

  Widget price(double value) {
    return Text('Ksh.$value');
  }

  Widget title(String title) {
    return Text(title);
  }
}
