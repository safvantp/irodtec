import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irodteck/presentation/controllers/product_controller.dart';
import 'presentation/pages/home/home_page.dart';

void main() {
    Get.put(ProductController()); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RealEstateHomePage(),
    );
  }
}
