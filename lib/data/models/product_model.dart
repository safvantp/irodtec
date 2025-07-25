import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.projectName,
    required super.location,
    required super.apartments,
    required super.unitSize,
    required super.price,
    required super.status,
    required super.developer,
    required super.highlights,
    required super.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      projectName: json['project_name'],
      location: json['location'],
      apartments: List<String>.from(json['apartments']),
      unitSize: json['unit_size'],
      price: json['price'],
      status: json['status'],
      developer: json['developer'],
      highlights: List<String>.from(json['highlights']),
      images: List<String>.from(json['images']),
    );
  }
}
