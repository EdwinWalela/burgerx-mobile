import 'package:flutter/material.dart';
import '../widgets/order_summary.dart';
import '../widgets/payment_options.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(margin: EdgeInsets.only(top: 20)),
          OrderSummary(isCheckout: true),
          Divider(),
          PaymentOptions(),
        ],
      ),
    );
  }
}
