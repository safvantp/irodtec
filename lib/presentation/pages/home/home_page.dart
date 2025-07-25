
import 'package:flutter/material.dart';
import 'package:irodteck/presentation/pages/CitiesSection/CitiesSection.dart';
import 'package:irodteck/presentation/pages/ContactSection/ContactSection.dart';
import 'package:irodteck/presentation/pages/PropertiesSection/property.dart';
import 'package:irodteck/presentation/pages/footer/FooterSection.dart';
import 'package:irodteck/presentation/pages/hero/hero.dart';



class RealEstateHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Column(
          children: [

            RealEstateHeroSection(),
            FeaturedPropertiesSection(),
            CitiesSection(),
            ContactSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
















