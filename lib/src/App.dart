import 'package:flutter/material.dart';
import 'screens/Burgers/Burgers.dart';
import 'screens/Drinks/Drinks.dart';
import 'screens/Meals/Meals.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Fast Food'),
            centerTitle: true,
            actions: [
              Icon(Icons.shopping_cart_outlined),
              Container(margin: EdgeInsets.only(right: 10.0))
            ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.lunch_dining)),
                Tab(icon: Icon(Icons.local_bar)),
                Tab(icon: Icon(Icons.fastfood))
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Burgers(),
              Drinks(),
              Meals(),
            ],
          ),
        ),
      ),
    );
  }
}
