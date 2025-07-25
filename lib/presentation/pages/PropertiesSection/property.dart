import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irodteck/presentation/pages/PropertiesSection/PropertyCard.dart';
import 'package:irodteck/presentation/controllers/product_controller.dart';

class FeaturedPropertiesSection extends StatelessWidget {
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Obx(() {
      final properties = controller.products;

      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.error.isNotEmpty) {
        return Center(child: Text(controller.error.value));
      }

      if (properties.isEmpty) {
        return const Center(child: Text("No properties available"));
      }

      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 40 : 20,
          vertical: 60,
        ),
        child: Column(
          children: [
            Text(
              'Discover your featured property',
              style: TextStyle(
                fontSize: isDesktop ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'leo mod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 40),

            isDesktop
                ? GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: properties.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return PropertyCard(properties[index]);
                    },
                  )
                : Column(
                    children: List.generate(
                      properties.length.clamp(0, 3), 
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: PropertyCard(properties[index]),
                      ),
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
