import 'package:burgers/src/models/Food_Item.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  FoodItem item;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(Icons.add),
                onTap: () {},
              ),
              Text('3'),
              InkWell(
                child: Icon(Icons.remove),
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
