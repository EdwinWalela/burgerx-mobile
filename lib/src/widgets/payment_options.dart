import 'package:flutter/material.dart';

class PaymentOptions extends StatelessWidget {
  final List<String> options = ["cash", "mpesa", "card"];

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
          Container(margin: EdgeInsets.only(bottom: 20)),
          Wrap(
            spacing: 40,
            runSpacing: 30,
            children: buildOptionCards(),
          ),
        ],
      ),
    );
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
            options.add(buildCard("Credit/Debit Card", "44************82"));
          }
          break;
        case "mpesa":
          {
            options.add(buildCard("M-Pesa", "0706****85"));
          }
      }
    }
    return options;
  }

  Widget buildCard(String title, String subtitle) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 110,
        minHeight: 80,
        maxWidth: 165,
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[500],
            width: 2.0,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "$title",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700]),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
              ),
              subtitle.length > 0
                  ? Text(
                      "$subtitle",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
