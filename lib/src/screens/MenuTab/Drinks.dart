import 'package:flutter/material.dart';
import '../../widgets/Item_list.dart';
import '../../models/Food_Item.dart';

class Drinks extends StatelessWidget {
  final List items;

  Drinks({this.items});

  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemList(items: items),
    );
  }
}
