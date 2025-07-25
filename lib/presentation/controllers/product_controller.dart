import 'package:get/get.dart';
import '../../core/errors/exceptions.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_products_usecase.dart';

class ProductController extends GetxController {
  final products = <ProductEntity>[].obs;
  final isLoading = true.obs;
  final error = ''.obs;

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
}
