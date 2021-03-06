import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final bool isCheckout;
  final List items;

  OrderSummary({this.isCheckout, this.items});

  int orderSum() {
    int sum = 0;
    for (var item in this.items) {
      sum += item["price"] * item["quantity"];
    }
    return sum;
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
      child: Column(
        children: [
          buildOrderTotal(orderSum()),
          Container(margin: EdgeInsets.only(top: 15)),
          buildDelivery('Langata, Maboko Cresent 37', 100),
          Container(margin: EdgeInsets.only(top: 15)),
          buildSumTotal(orderSum() + 100),
          Container(margin: EdgeInsets.only(top: 20)),
          !isCheckout ? buildCheckoutButton(context) : Container(),
        ],
      ),
    );
  }

  Widget buildOrderTotal(int total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Order Total",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        Text(
          "KSH.$total",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
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
            Text(
              "Delivery",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 20,
                  color: Colors.orange[600],
                ),
                Text(
                  "$address",
                  // style: TextStyle(fontSize: 20),
                ),
              ],
            )
          ],
        ),
        Text(
          "KSH. $cost",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget buildSumTotal(int total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Order Total",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        Text(
          "KSH. $total",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget buildCheckoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange[600],
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Checkout",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
