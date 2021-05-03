import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  PageHeader({this.title, this.subtitle});

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle(),
        Container(margin: EdgeInsets.only(bottom: 10)),
        buildSubtitle(),
      ],
    );
  }

  Widget buildTitle() {
    return Text(
      this.title,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget buildSubtitle() {
    return Text(
      this.subtitle,
      style: TextStyle(
        fontSize: 20,
        color: Colors.grey[600],
      ),
    );
  }
}
