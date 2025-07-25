import 'package:flutter/material.dart';
import 'package:irodteck/presentation/pages/ContactSection/wid/contentwid.dart';
import 'package:irodteck/presentation/pages/content/content.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 40 : 20,
        vertical: 60,
      ),
      child: isDesktop ?
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ContactForm(),
          ),
          SizedBox(width: 60),
          Expanded(
            child: ContactInfo(),
          ),
        ],
      ) :
      Column(
        children: [
          ContactForm(),
          SizedBox(height: 40),
          ContactInfo(),
        ],
      ),
    );
  }
}