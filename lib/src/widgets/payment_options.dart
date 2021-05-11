import 'package:flutter/material.dart';

class PaymentOptions extends StatelessWidget {
  final List<String> options = ["cash", "mpesa", "card"];

  Widget build(BuildContext context) {
    return Wrap(
      children: buildOptionCards(),
    );
  }

  List<Widget> buildOptionCards() {
    List<Widget> options;

    for (var option in this.options) {
      switch (option) {
        case "cash":
          {
            options.add(
              Container(
                child: Text("Cash on Delivery"),
              ),
            );
          }
          break;
        case "mpesa":
          {
            options.add(
              Container(
                child: Text("M-Pesa"),
              ),
            );
          }
          break;
        case "card":
          {
            options.add(
              Container(
                child: Text("Credit/Debit Card"),
              ),
            );
          }
      }
    }
    return options;
  }
}
