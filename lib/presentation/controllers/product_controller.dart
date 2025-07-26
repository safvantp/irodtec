import 'package:get/get.dart';
import '../../core/errors/exceptions.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_products_usecase.dart';

class ProductController extends GetxController {
  final products = <ProductEntity>[].obs;
  final filteredProducts = <ProductEntity>[].obs;
  final isLoading = true.obs;
  final error = ''.obs;
  
  final selectedCategory = ''.obs;
  final selectedPropertyType = ''.obs;
  final selectedLocation = ''.obs;

  late final GetProductsUseCase _getProductsUseCase;

  @override
  void onInit() {
    super.onInit();
    _getProductsUseCase = GetProductsUseCase(ProductRepositoryImpl());
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      error.value = '';
      final result = await _getProductsUseCase();
      products.assignAll(result);
      filteredProducts.assignAll(result); 
    } on ServerException catch (e) {
      error.value = e.message;
    } on NetworkException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = 'Unexpected error occurred';
    } finally {
      isLoading.value = false;
    }
  }

  void updateSearchFilters({
    String? category,
    String? propertyType,
    String? location,
  }) {
    if (category != null) selectedCategory.value = category;
    if (propertyType != null) selectedPropertyType.value = propertyType;
    if (location != null) selectedLocation.value = location;
  }

  void searchProperties() {
    List<ProductEntity> filtered = products.toList();

    if (selectedCategory.isNotEmpty && selectedCategory.value != 'All Categories') {
      filtered = filtered.where((property) => 
        property.status.toLowerCase().contains(selectedCategory.value.toLowerCase())
      ).toList();
    }

    if (selectedPropertyType.isNotEmpty && selectedPropertyType.value != 'All Types') {
     
      filtered = filtered.where((property) => 
        property.projectName.toLowerCase().contains(selectedPropertyType.value.toLowerCase())
      ).toList();
    }

    if (selectedLocation.isNotEmpty && selectedLocation.value != 'All Locations') {
      filtered = filtered.where((property) => 
        property.location.toLowerCase().contains(selectedLocation.value.toLowerCase())
      ).toList();
    }

    filteredProducts.assignAll(filtered);
  }

  void clearFilters() {
    selectedCategory.value = '';
    selectedPropertyType.value = '';
    selectedLocation.value = '';
    filteredProducts.assignAll(products);
  }

  List<String> get availableCategories {
    final categories = products.map((p) => p.status).toSet().toList();
    categories.insert(0, 'All Categories');
    return categories;
  }

  List<String> get availableLocations {
    final locations = products.map((p) => p.location).toSet().toList();
    locations.insert(0, 'All Locations');
    return locations;
  }

  List<String> get availablePropertyTypes {
    return ['All Types', 'Apartment', 'House', 'Villa', 'Condo', 'Townhouse'];
  }
}