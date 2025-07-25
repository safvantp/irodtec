class ProductEntity {
  final String projectName;
  final String location;
  final List<String> apartments;
  final String unitSize;
  final String price;
  final String status;
  final String developer;
  final List<String> highlights;
  final List<String> images;

  ProductEntity({
    required this.projectName,
    required this.location,
    required this.apartments,
    required this.unitSize,
    required this.price,
    required this.status,
    required this.developer,
    required this.highlights,
    required this.images,
  });
}
