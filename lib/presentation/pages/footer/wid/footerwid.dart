

import 'package:flutter/material.dart';

class FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  FooterColumn(this.title, this.items);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        ...items.map((item) => Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            item,
            style: TextStyle(color: Colors.grey.shade400),
          ),
        )).toList(),
     ],
);
}
}