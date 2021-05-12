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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(margin: EdgeInsets.only(top: 20)),
            OrderSummary(isCheckout: true),
            Divider(),
            PaymentOptions(),
            Container(margin: EdgeInsets.only(top: 60)),
            buildCompleteOrderButton(),
          ],
        ),
      ),
    );
  }

  Widget buildCompleteOrderButton() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange[600],
          ),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Complete Order",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
