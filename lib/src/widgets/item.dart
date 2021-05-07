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
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(margin: EdgeInsets.only(right: 10.0)),
          thumbnail(_item.thumb),
          Container(margin: EdgeInsets.only(right: 20.0)),
          detailsColumn(_item),
        ],
      ),
    );
  }

  Widget thumbnail(String thumb) {
    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.network(
          thumb,
        ),
      ),
    );
  }

  Widget detailsColumn(FoodItem item) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(margin: EdgeInsets.only(bottom: 10.0)),
          title(item.name),
          Container(margin: EdgeInsets.only(bottom: 5.0)),
          description(item.ingredients),
          Container(margin: EdgeInsets.only(bottom: 5.0)),
          priceStarsRow(item.stars, item.price),
          Container(margin: EdgeInsets.only(bottom: 5.0)),
          // addToCartBtn(),
        ],
      ),
    );
  }

  Widget title(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget description(String desc) {
    return Text(
      desc,
      style: TextStyle(
        fontSize: 15.0,
      ),
    );
  }

  Widget stars(double value) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 20.0,
          color: Colors.yellow,
        ),
        Text(
          '$value',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget price(int value) {
    return Text(
      'KSH.$value',
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget priceStarsRow(double starsValue, int priceValue) {
    return Row(
      children: [
        stars(starsValue),
        Container(margin: EdgeInsets.only(right: 10)),
        price(priceValue),
        Container(margin: EdgeInsets.only(right: 40)),
        addToCartBtn(),
      ],
    );
  }

  Widget addToCartBtn() {
    return TextButton(
      onPressed: () {},
      child: Icon(
        Icons.shopping_bag_outlined,
        color: Colors.black,
      ),
    );
  }
}
