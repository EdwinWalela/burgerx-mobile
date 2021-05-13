import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "BurgerX",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fastfood_outlined,
              color: Colors.orange[600],
              size: 60,
            ),
            Container(margin: EdgeInsets.only(top: 30)),
            Text(
              "Thanks For Reaching This Far",
              style: TextStyle(fontSize: 20),
            ),
            Container(margin: EdgeInsets.only(top: 10)),
            Text(
              "This is a sample app built with Flutter implementing basic functionalities",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            Container(margin: EdgeInsets.only(top: 10)),
            Text(
              "Source code can be found on my Github",
              style: TextStyle(fontSize: 17),
            ),
            InkWell(
              child: Icon(
                Icons.link,
                size: 30,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
