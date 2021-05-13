import 'package:burgers/src/blocs/cart_bloc_provider.dart';
import 'package:flutter/material.dart';
import '../widgets/order_summary.dart';
import '../widgets/payment_options.dart';

class CheckoutScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = CartBlocProvider.of(context);
    bloc.fetchCart();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Order Summary",
        ),
      ),
      body: StreamBuilder(
        stream: bloc.dbCart,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_shopping_cart_outlined,
                    size: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                  ),
                  Text(
                    "Your Cart Is Empty",
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                  ),
                  buildContinueShoppingButton(context),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(margin: EdgeInsets.only(top: 20)),
                OrderSummary(
                  isCheckout: true,
                  items: snapshot.data,
                ),
                Divider(
                  color: Colors.orange[500].withOpacity(0.2),
                  thickness: 5,
                ),
                Container(margin: EdgeInsets.only(top: 10)),
                PaymentOptions(),
                Container(margin: EdgeInsets.only(top: 10)),
                buildCompleteOrderButton(),
                Container(margin: EdgeInsets.only(top: 20)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildContinueShoppingButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 200,
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange[600],
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/menu");
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Continue Shopping",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
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
