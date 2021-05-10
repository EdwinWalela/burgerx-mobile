import 'package:flutter/material.dart';
import '../widgets/cart_list.dart';
import '../models/Food_Item.dart';

class CartScreen extends StatelessWidget {
  final items = [
    FoodItem("_id", 0, "https://bit.ly/3d4kqEO", "Beef BBQ Burger", 650, 4,
        "ingredients"),
    FoodItem("_id", 0, "https://bit.ly/3d4kqEO", "Beef BBQ Burger", 650, 4,
        "ingredients"),
    FoodItem("_id", 0, "https://bit.ly/3d4kqEO", "Beef BBQ Burger", 650, 4,
        "ingredients"),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "My Order",
        ),
      ),
      body: CartList(items: items),
    );
  }
}
