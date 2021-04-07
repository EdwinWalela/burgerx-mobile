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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 3,
            color: Colors.grey.withOpacity(0.3),
            offset: Offset(3, 5),
          )
        ],
      ),
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(margin: EdgeInsets.only(right: 10.0)),
          thumbnail(_item.thumb),
          Container(margin: EdgeInsets.only(right: 20.0)),
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
        width: 160,
        height: 160,
      ),
    );
  }

  Widget detailsColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(margin: EdgeInsets.only(bottom: 10.0)),
        title('BBQ Beef Burger'),
        Container(margin: EdgeInsets.only(bottom: 5.0)),
        stars(3),
        Container(margin: EdgeInsets.only(bottom: 5.0)),
        price(550),
        Container(margin: EdgeInsets.only(bottom: 5.0)),
        addToCartBtn(),
      ],
    );
  }

  Widget addToCartBtn() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.shopping_bag_outlined),
      label: Text('Add to Cart'),
    );
  }

  Widget stars(double value) {
    List<Icon> stars = [];

    for (var i = 0; i < value; i++) {
      stars.add(Icon(Icons.star_rate_outlined));
    }
    return Row(children: stars);
  }

  Widget price(double value) {
    return Text(
      'KSH.$value',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget title(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
      ),
    );
  }
}
