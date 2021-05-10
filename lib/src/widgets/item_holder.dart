import 'package:burgers/src/models/Food_Item.dart';
import 'package:flutter/material.dart';

class ItemHolder extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 3,
            color: Colors.grey.withOpacity(0.1),
            offset: Offset(0, 3),
          )
        ],
      ),
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(margin: EdgeInsets.only(right: 10.0)),
          thumbnail(),
          Container(margin: EdgeInsets.only(right: 20.0)),
          detailsColumn(),
        ],
      ),
    );
  }

  Widget thumbnail() {
    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          color: Colors.grey[300],
          height: 80,
        ),
      ),
    );
  }

  Widget detailsColumn() {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(margin: EdgeInsets.only(bottom: 10.0)),
          title(),
          Container(margin: EdgeInsets.only(bottom: 5.0)),
          description(),
          Container(margin: EdgeInsets.only(bottom: 20.0)),
          priceStarsRow(),
          Container(margin: EdgeInsets.only(bottom: 5.0)),
          // addToCartBtn(),
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      color: Colors.grey[300],
      width: 100,
      height: 15,
    );
  }

  Widget description() {
    return Container(
      color: Colors.grey[300],
      width: 200,
      height: 15,
    );
  }

  Widget stars() {
    return Row(
      children: [
        Container(
          color: Colors.grey[300],
          width: 40,
          height: 15,
        )
      ],
    );
  }

  Widget price() {
    return Container(
      color: Colors.grey[300],
      width: 60,
      height: 15,
    );
  }

  Widget priceStarsRow() {
    return Row(
      children: [
        stars(),
        Container(margin: EdgeInsets.only(right: 10)),
        price(),
        Container(margin: EdgeInsets.only(right: 40)),
        addToCartBtn(),
      ],
    );
  }

  Widget addToCartBtn() {
    return Container(
      color: Colors.grey[300],
      width: 40,
      height: 15,
    );
  }
}
