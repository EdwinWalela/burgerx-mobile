import 'package:flutter/material.dart';
import 'Burgers.dart';
import 'Drinks.dart';
import 'Meals.dart';

class MenuTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_bag_outlined),
          onPressed: () {},
        ),
        appBar: AppBar(
          title: Text('Fast Food'),
          centerTitle: true,
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
    );
  }
}
