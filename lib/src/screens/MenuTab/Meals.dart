import 'package:flutter/material.dart';
import '../../models/Food_Item.dart';
import '../../widgets/Item_list.dart';

class Meals extends StatelessWidget {
  final List items;

  Meals({this.items});

  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemList(items: items),
    );
  }
}
