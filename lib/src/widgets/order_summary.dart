import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          buildOrderTotal(1250),
          buildDelivery('Langata, Maboko Cresent 37', 150),
          buildSumTotal(1650),
        ],
      ),
    );
  }

  Widget buildOrderTotal(int total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Order Total"),
        Text("KSH.$total"),
      ],
    );
  }

  Widget buildDelivery(String address, int cost) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Delivery"),
            Text("$address"),
          ],
        ),
        Text("KSH. $cost"),
      ],
    );
  }

  Widget buildSumTotal(int total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Order Total"),
        Text("KSH. $total"),
      ],
    );
  }
}
