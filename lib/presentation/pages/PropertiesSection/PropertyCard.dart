import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:irodteck/presentation/pages/PropertiesSection/wid/PropertyFeature.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../domain/entities/product_entity.dart';

class PropertyCard extends StatelessWidget {
  final ProductEntity property;

  PropertyCard(this.property);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Container(
  
      height: isDesktop ? 400 : 320,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: isDesktop ? 220 : 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                image: DecorationImage(
                  image: NetworkImage(
                    property.images.isNotEmpty
                        ? property.images.first
                        : 'https://cdn.pixabay.com/photo/2017/01/18/15/25/architecture-1999590_1280.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: property.status.toLowerCase().contains("rent")
                            ? Colors.purple
                            : Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        property.status,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.projectName,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      property.location,
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                                        SizedBox(height: 4),

                    Text(
                      property.price,
                      style: TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(color: Colors.black12,thickness: 1,),
                SizedBox(height: 8),
          
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PropertyFeature(Ionicons.bed_outline , property.apartments.isNotEmpty ? property.apartments.first : "0",'Bedroom'),
                    PropertyFeature(PhosphorIconsRegular.bathtub, "2",'Bathroom'), 
                    PropertyFeature(PhosphorIconsRegular.arrowsOut, property.unitSize,'Total Area'),
                    PropertyFeature(PhosphorIconsRegular.garage, "1",'Garage'), 
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
