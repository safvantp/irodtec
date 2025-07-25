import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:irodteck/presentation/controllers/product_controller.dart';
import 'package:irodteck/presentation/pages/CitiesSection/wid/CityCard.dart';

class CitiesSection extends StatelessWidget {
  final List<Map<String, String>> cities = [
    {
      'name': 'New York',
      'properties': '23 properties',
      'image': 'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'
    },
    {
      'name': 'Boston',
      'properties': '12 properties',
      'image': 'https://images.unsplash.com/photo-1501594907352-04cda38ebc29?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'
    },
    {
      'name': 'Washington',
      'properties': '18 properties',
      'image': 'https://images.unsplash.com/photo-1550850839-8dc894ed385a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'
    },
    {
      'name': 'Miami',
      'properties': '25 properties',
      'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'
    },
    {
      'name': 'Chicago',
      'properties': '7 properties',
      'image': 'https://images.unsplash.com/photo-1477414348463-c0eb7f1359b6?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'
    },
  ];

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth > 768 && screenWidth <= 1024;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 40 : 20,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What city will you live in?',
            style: TextStyle(
              fontSize: isDesktop ? 36 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 40),
          _buildCustomGrid(context, isDesktop, isTablet),
        ],
      ),
    );
  }

  Widget _buildCustomGrid(BuildContext context, bool isDesktop, bool isTablet) {
    if (!isDesktop && !isTablet) {
      return Column(
        children: cities.map((city) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CityCard(
              city['name']!,
              city['image']!,
              properties: city['properties']!,
              height: 180, 
            ),
          );
        }).toList(),
      );
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CityCard(
                cities[0]['name']!,
                cities[0]['image']!,
                properties: cities[0]['properties']!,
                height: isDesktop ? 300 : 250,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: CityCard(
                cities[1]['name']!,
                cities[1]['image']!,
                properties: cities[1]['properties']!,
                height: isDesktop ? 300 : 250,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: CityCard(
                cities[2]['name']!,
                cities[2]['image']!,
                properties: cities[2]['properties']!,
                height: isDesktop ? 200 : 180,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: CityCard(
                cities[3]['name']!,
                cities[3]['image']!,
                properties: cities[3]['properties']!,
                height: isDesktop ? 200 : 180,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: CityCard(
                cities[4]['name']!,
                cities[4]['image']!,
                properties: cities[4]['properties']!,
                height: isDesktop ? 200 : 180,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
