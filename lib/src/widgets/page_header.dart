import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  PageHeader({this.title, this.subtitle});

  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitle(),
        buildSubtitle(),
      ],
    );
  }

  Widget buildTitle() {
    return Text(this.title);
  }

  Widget buildSubtitle() {
    return Text(this.subtitle);
  }
}
