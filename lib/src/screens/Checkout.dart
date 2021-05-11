import 'package:flutter/material.dart';
import '../widgets/order_summary.dart';

class CheckoutScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Order Summary",
        ),
      ),
      body: Column(
        children: [
          OrderSummary(isCheckout: true),
        ],
      ),
    );
  }
}
