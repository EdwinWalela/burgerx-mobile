import 'package:flutter/material.dart';

class PaymentOptions extends StatelessWidget {
  final List<String> options = ["cash", "mpesa", "card"];

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Options",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
            ),
            Wrap(
              spacing: 40,
              runSpacing: 30,
              children: buildOptionCards(),
            ),
          ],
        ));
  }

  List<Widget> buildOptionCards() {
    List<Widget> options = [];

    for (var option in this.options) {
      switch (option) {
        case "cash":
          {
            options.add(buildCard("Cash on Delivery", ""));
          }
          break;
        case "card":
          {
            options.add(buildCard("Credit/Debit Card", ""));
          }
          break;
        case "mpesa":
          {
            options.add(buildCard("M-Pesa", ""));
          }
      }
    }
    return options;
  }

  Widget buildCard(String title, String subtitle) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 100,
        maxWidth: 150,
      ),
      child: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Center(
          child: Text("$title"),
        ),
      ),
    );
  }
}
