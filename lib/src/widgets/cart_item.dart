import 'package:burgers/src/blocs/cart_bloc_provider.dart';
import 'package:burgers/src/models/Cart_Item.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final CartBloc bloc;

  CartItemCard({this.item, this.bloc});

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20, right: 20),
      child: Row(
        children: [
          thumbnail(item.thumb),
          title(item.name, bloc),
          price(item.price * this.item.quantity),
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

  Widget title(String title, CartBloc bloc) {
    return Expanded(
      flex: 2,
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
                onTap: () {
                  bloc.addItem(this.item);
                  bloc.addToCart();
                },
              ),
              Container(margin: EdgeInsets.only(right: 10)),
              Text(
                '${this.item.quantity}',
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
                onTap: () {
                  bloc.removeFromCart(this.item);
                },
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
