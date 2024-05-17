import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/customers/customers.dart';
import 'package:technaureus_machine_test/features/products/products.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    on<AddToCart>(_onAddToCart);
    on<GetCart>(_onFetchCart);
    on<OnQuantityChange>(_onQuantityChange);
    on<ClearCart>(_onClearCart);
    on<OnOrder>(_onOrder);
  }
  final HiveService hiveService = HiveService();
  final CartRepository cartRepository = CartRepository();

  Future<void> _onAddToCart(
    AddToCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      final response = await hiveService.addToCart(event.cartModel);
      final totalPrice = _onCalculateTotalPrice(response);
      emit(state.copyWith(
        status: CartStatus.addedSuccessfully,
        cartItems: response,
        totalPrice: totalPrice,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CartStatus.exception,
        errorMessage: 'An error occurred',
      ));
    }
  }

  Future<void> _onOrder(
    OnOrder event,
    Emitter<CartState> emit,
  ) async {
    try {
      final response = await cartRepository.onOrder(OrderRequestModel(
          customerId: event.id,
          totalPrice: state.totalPrice,
          products: state.cartItems
              .map((item) => ProductData(
                    productId: item.id,
                    quantity: item.quantity,
                    price: item.price,
                  ))
              .toList()));
      if (response.success ?? false) {
        await hiveService.clearCart();
        emit(state.copyWith(
          status: CartStatus.orderCompleted,
        ));
        emit(state.copyWith(
          status: CartStatus.initial,
        ));
      } else {
        emit(state.copyWith(
          status: CartStatus.exception,
          errorMessage: response.error,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: CartStatus.exception,
        errorMessage: "An Error Occured",
      ));
    }
  }

  Future<void> _onFetchCart(
    GetCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      List<CartModel> response = await hiveService.getCart();
      final totalPrice = _onCalculateTotalPrice(response);
      emit(state.copyWith(
        status: CartStatus.fetched,
        cartItems: response,
        totalPrice: totalPrice,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CartStatus.exception,
        errorMessage: 'An error occurred',
      ));
    }
  }

  Future<void> _onQuantityChange(
    OnQuantityChange event,
    Emitter<CartState> emit,
  ) async {
    final items = await hiveService.quantityChange(event.id, event.type);
    final totalPrice = _onCalculateTotalPrice(items);

    emit(state.copyWith(
      status: CartStatus.quantityChanged,
      cartItems: items,
      totalPrice: totalPrice,
    ));
  }

  Future<void> _onClearCart(
    ClearCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      await hiveService.clearCart();
      emit(state.copyWith(
        status: CartStatus.cartCleared,
        cartItems: [],
        totalPrice: 0,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CartStatus.exception,
        errorMessage: 'An error occurred',
      ));
    }
  }

  int _onCalculateTotalPrice(List<CartModel> items) {
    int totalPrice = items.fold(
      0,
      (total, element) => total + element.price * element.quantity,
    );

    return totalPrice;
  }
}
