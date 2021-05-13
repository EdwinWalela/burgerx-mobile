import 'package:burgers/src/blocs/payment_bloc_provider.dart';
import 'package:flutter/material.dart';

class PaymentOptions extends StatelessWidget {
  final List<String> options = ["cash", "mpesa", "card"];
  final String activePaymentMode = "cash";

  Widget build(BuildContext context) {
    final bloc = PaymentBlocProvider.of(context);

    return StreamBuilder(
      stream: bloc.method,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final String activePaymentMode =
            snapshot.hasData ? snapshot.data : options[0];
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
                spacing: 10,
                runSpacing: 30,
                children: buildOptionCards(activePaymentMode, bloc),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> buildOptionCards(String activePaymentMode, PaymentBloc bloc) {
    List<Widget> options = [];

    for (var option in this.options) {
      switch (option) {
        case "cash":
          {
            options.add(buildCard(
                "Cash on Delivery", "", activePaymentMode == "cash", bloc));
          }
          break;
        case "card":
          {
            options.add(buildCard("Credit/Debit Card", "44************82",
                activePaymentMode == "card", bloc));
          }
          break;
        case "mpesa":
          {
            options.add(buildCard(
                "M-Pesa", "0706****85", activePaymentMode == "mpesa", bloc));
          }
      }
    }
    return options;
  }

  Widget buildCard(
      String title, String subtitle, bool active, PaymentBloc bloc) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 110,
        minHeight: 80,
        maxWidth: 150,
      ),
      child: InkWell(
        onTap: () {
          if (title == "M-Pesa") {
            bloc.changeMethod("mpesa");
          }
          if (title == "Credit/Debit Card") {
            bloc.changeMethod("card");
          }
          if (title == "Cash on Delivery") {
            bloc.changeMethod("cash");
          }
        },
        child: Container(
          padding: EdgeInsets.all(17),
          decoration: BoxDecoration(
            border: active
                ? Border.all(color: Colors.purple.withOpacity(0.6), width: 3)
                : null,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.orange[600].withOpacity(!active ? 0.1 : 0),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                ),
                subtitle.length > 0
                    ? Text(
                        "$subtitle",
                        style: TextStyle(fontSize: 12, color: Colors.purple),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
