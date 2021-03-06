import 'package:burgers/src/blocs/cart_bloc_provider.dart';
import 'package:burgers/src/models/Cart_Item.dart';
import 'package:burgers/src/models/Food_Item.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  FoodItem _item;

  Item(FoodItem item) {
    _item = item;
  }

  Widget build(BuildContext context) {
    final bloc = CartBlocProvider.of(context);

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
          thumbnail(_item.thumb),
          Container(margin: EdgeInsets.only(right: 20.0)),
          detailsColumn(_item, bloc, context),
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

  Widget detailsColumn(FoodItem item, CartBloc bloc, BuildContext context) {
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
          priceStarsRow(item.stars, item.price, bloc, context),
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
            fontWeight: FontWeight.w600,
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

  Widget priceStarsRow(
      double starsValue, int priceValue, CartBloc bloc, BuildContext context) {
    return Row(
      children: [
        stars(starsValue),
        Container(margin: EdgeInsets.only(right: 10)),
        price(priceValue),
        Container(margin: EdgeInsets.only(right: 40)),
        addToCartBtn(bloc, context),
      ],
    );
  }

  Widget addToCartBtn(CartBloc bloc, BuildContext context) {
    return TextButton(
      onPressed: () {
        bloc.addItem(
          CartItem(
              id: this._item.id,
              name: this._item.name,
              price: this._item.price,
              quantity: 0,
              thumb: this._item.thumb),
        );
        bloc.addToCart();
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.orange[600],
                // duration: Duration(seconds: 4),
                content: Text(
                  '${this._item.name} added to cart',
                ),
                action: SnackBarAction(
                  label: "View Cart",
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/cart");
                  },
                ),
              ),
            );
          },
        );
      },
      child: Icon(
        Icons.shopping_bag_outlined,
        color: Colors.black,
      ),
    );
  }
}
