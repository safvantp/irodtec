import 'package:flutter/material.dart';
import 'package:irodteck/presentation/pages/footer/wid/footerwid.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Container(
      color: Colors.grey.shade900,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 40 : 20,
        vertical: 40,
      ),
      child: Column(
        children: [
          isDesktop ?
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: FooterColumn('Opening hours', ['Mon-Fri: 08:00AM - 09:00PM', 'Sat-Sun: 08:00AM - 05:00PM'])),
              Expanded(child: FooterColumn('Find Us', ['2181 Tanglewood Ave', 'suite 204, Rochester'])),
              Expanded(child: FooterColumn('Property', ['Apartments', 'Villas', 'Offices', 'Commercial'])),
              Expanded(child: FooterColumn('Links', ['Home', 'Properties', 'Services', 'About'])),
              Expanded(child: FooterColumn('Resources', ['Subscribe to our Newsletter'])),
            ],
          ) :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FooterColumn('Opening hours', ['Mon-Fri: 08:00AM - 09:00PM', 'Sat-Sun: 08:00AM - 05:00PM']),
              SizedBox(height: 30),
              FooterColumn('Property', ['Apartments', 'Villas', 'Offices', 'Commercial']),
              SizedBox(height: 30),
              FooterColumn('Links', ['Home', 'Properties', 'Services', 'About']),
            ],
          ),
          SizedBox(height: 40),
          Divider(color: Colors.grey.shade700),
          SizedBox(height: 20),
          Text(
            '© 2023 Real Estate. All Rights Reserved.',
            style: TextStyle(color: Colors.grey.shade400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
