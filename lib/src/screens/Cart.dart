import 'package:burgers/src/blocs/cart_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/cart_list.dart';
import '../widgets/order_summary.dart';
import '../models/Food_Item.dart';

class CartScreen extends StatelessWidget {
  final items = [
    FoodItem("_id", 0, "https://bit.ly/3d4kqEO", "Beef BBQ Burger", 650, 4,
        "ingredients"),
    FoodItem("_id", 0, "https://bit.ly/3d4kqEO", "Beef BBQ Burger", 650, 4,
        "ingredients"),
    FoodItem("_id", 0, "https://bit.ly/3d4kqEO", "Beef BBQ Burger", 650, 4,
        "ingredients"),
    FoodItem("_id", 0, "https://bit.ly/3d4kqEO", "Beef BBQ Burger", 650, 4,
        "ingredients"),
  ];

  Widget build(BuildContext context) {
    final bloc = CartBlocProvider.of(context);
    bloc.fetchCart();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "My Order",
        ),
      ),
      body: StreamBuilder(
        stream: bloc.dbCart,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // print(snapshot.data);
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_shopping_cart_outlined,
                    size: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                  ),
                  Text(
                    "Your Cart Is Empty",
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                  ),
                  buildContinueShoppingButton(context),
                ],
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                CartList(items: snapshot.data),
                Divider(thickness: 2),
                OrderSummary(isCheckout: false),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildContinueShoppingButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 200,
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange[600],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Continue Shopping",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
