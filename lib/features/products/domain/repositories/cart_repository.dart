import 'package:technaureus_machine_test/core/network/api_manager.dart';
import 'package:technaureus_machine_test/core/network/base_result.dart';
import 'package:technaureus_machine_test/features/customers/domain/models/models.dart';

class CartRepository {
  final apiManager = ApiManager();

  Future<Result<bool>> onOrder(OrderRequestModel requestModel) async {
    try {
      final response = await apiManager.post('/api/orders/', data: {
        "customer_id": requestModel.customerId,
        "total_price": requestModel.totalPrice,
        "products": requestModel.products
      });
      if (response.message == 'success') {
        return const Result.success(true);
      }
      return const Result.failure("An Error Occured when Creating Order");
    } catch (e) {
      return const Result.failure("Something went wrong");
    }
  }
}
