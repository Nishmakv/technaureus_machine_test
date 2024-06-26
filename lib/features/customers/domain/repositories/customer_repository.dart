import 'package:technaureus_machine_test/core/network/network.dart';
import 'package:technaureus_machine_test/features/customers/customers.dart';

class CustomerRepository {
  final apiManager = ApiManager();
  List<CustomerModel> customerModel = [];

  Future<Result<List<CustomerModel>>> getCustomers() async {
    try {
      final response = await apiManager.get(
        ApiUris.customerUri,
      );
      if (response.message == 'success') {
        final productData = response.data as List<dynamic>;
        final result =
            productData.map((e) => CustomerModel.fromJson(e)).toList();
        return Result.success(result);
      }
      return const Result.failure('Api fetching failed');
    } catch (e) {
      return const Result.failure('an error occurred');
    }
  }

  Future<Result<List<CustomerModel>>> customerSearch(String searchQuery) async {
    try {
      final response = await apiManager.get(
        ApiUris.customerUri,
        queryParameters: {'search_query': searchQuery},
      );
      if (response.message == 'success') {
        final productData = response.data as List<dynamic>;
        final result =
            productData.map((e) => CustomerModel.fromJson(e)).toList();
        return Result.success(result);
      }
      return const Result.failure('Api fetching failed');
    } catch (e) {
      return const Result.failure('An error occurred');
    }
  }

  Future<Result<bool>> createCustomer(
      {required CustomerRequestModel customerRequestModel}) async {
    try {
      final response = await apiManager.post(ApiUris.customerUri,
          data: customerRequestModel.toJson());
      if (response.message == 'success') {
        return const Result.success(true);
      }
      return const Result.failure('Api request failed');
    } catch (e) {
      return const Result.failure('An error occurred');
    }
  }

  Future<Result<bool>> updateCustomer(
      {required CustomerRequestModel customerRequestModel,
      required int id}) async {
    try {
      final response = await apiManager.put(
        ApiUris.customerUri,
        queryParameters: {'id': id.toString()},
      );
      if (response.message == 'success') {
        return const Result.success(true);
      }
      return const Result.failure('Api request failed');
    } catch (e) {
      return const Result.failure('An error occurred');
    }
  }

  Future<Result<bool>> createOrder(
      {required OrderRequestModel orderRequestModel}) async {
    try {
      final response = await apiManager.post(ApiUris.orderUri,
          data: orderRequestModel.toJson());
      if (response.message == 'success') {
        return const Result.success(true);
      }
      return const Result.failure('Api request failed');
    } catch (e) {
      return const Result.failure('An error occurred');
    }
  }
}
