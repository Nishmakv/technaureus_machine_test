import 'package:technaureus_machine_test/core/network/api_manager.dart';
import 'package:technaureus_machine_test/core/network/api_uris.dart';
import 'package:technaureus_machine_test/core/network/base_result.dart';
import 'package:technaureus_machine_test/features/products/domain/models/models.dart';

class ProductRepository {
  final apiManager = ApiManager();

  Future<Result<List<ProductModel>>> getProducts() async {
    try {
      final response = await apiManager.get(
        ApiUris.productUri,
      );
      if (response.message == 'success') {
        final productData = response.data as List<dynamic>;
        final result =
            productData.map((e) => ProductModel.fromJson(e)).toList();
        return Result.success(result);
      }
      return const Result.failure('Api fetching failed');
    } catch (e) {
      return const Result.failure('an error occurred');
    }
  }

  

  Future<Result<ProductModel>> getProductById(int id) async {
    try {
      final response = await apiManager.get(
        ApiUris.productUri,
        queryParameters: {'id': id.toString()},
      );
      if (response.message == 'success') {
        final product = response.data;
        final result = ProductModel.fromJson(product);
        return Result.success(result);
      }
      return const Result.failure('Api fetching failed');
    } catch (e) {
      return const Result.failure('an error occurred');
    }
  }

  Future<Result<List<ProductModel>>> productSearch(String searchQuery) async {
    try {
      final response = await apiManager.get(
        ApiUris.productUri,
        queryParameters: {'search_query': searchQuery},
      );
      if (response.message == 'success') {
        final productData = response.data as List<dynamic>;
        final result =
            productData.map((e) => ProductModel.fromJson(e)).toList();
        return Result.success(result);
      }
      return const Result.failure('Api fetching failed');
    } catch (e) {
      return const Result.failure('An error occurred');
    }
  }
}
