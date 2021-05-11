import 'package:burgers/src/models/Food_Item.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final FoodItem item;

  CartItem({this.item});

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20, right: 20),
      child: Row(
        children: [
          thumbnail(item.thumb),
          title(item.name),
          price(item.price),
        ],
      ),
    );
  }

  Widget thumbnail(String thumb) {
    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          thumb,
          height: 70,
          width: 70,
        ),
      ),
    );
  }

  Widget detailsColumn(FoodItem item) {
    return Wrap(
      spacing: 50,
      children: [
        title(item.name),
        price(item.price),
        // addToCartBtn(),
      ],
    );
  }

  Widget title(String title) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 50),
              ),
              InkWell(
                child: Icon(
                  Icons.add_circle,
                ),
                onTap: () {},
              ),
              Container(margin: EdgeInsets.only(right: 10)),
              Text(
                '3',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              Container(margin: EdgeInsets.only(right: 10)),
              InkWell(
                child: Icon(
                  Icons.remove_circle,
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget price(int value) {
    return Expanded(
      flex: 1,
      child: Text(
        'KSH.$value',
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
