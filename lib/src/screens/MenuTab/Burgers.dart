import 'package:burgers/src/models/Food_Item.dart';
import 'package:burgers/src/widgets/Item_list.dart';
import 'package:flutter/material.dart';

class Burgers extends StatelessWidget {
  final List items;

  Burgers({this.items});

  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemList(items: items),
    );
  }
}
