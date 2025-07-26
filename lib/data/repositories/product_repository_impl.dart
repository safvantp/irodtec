import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';
import '../../core/errors/exceptions.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse(ApiConstants.productsUrl),
        headers: {
          'Authorization': 'Bearer ${ApiConstants.apiKey}',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData['status'] != 'success') {
          throw ServerException("Unexpected API response");
        }

        final List data = jsonData['data'];
        print(data);
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw ServerException('Server Error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      } else {
        throw NetworkException('Please check your internet connection.');
      }
      
    }
  }
}
