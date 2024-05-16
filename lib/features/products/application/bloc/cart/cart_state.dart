part of 'cart_bloc.dart';

enum CartStatus {
  initial,
  fetching,
  removedFromFav,
  fetched,
  exception,
  addedSuccessfully,
  removedSuccessfully,
  orderCompleted,
  quantityChanged,
  cartCleared
}

class CartState extends Equatable {
  final CartStatus status;
  final String? errorMessage;
  final int totalPrice;
  final List<CartModel> cartItems;
  final List<ProductModel> productModel;
  bool get canShowNoData => ((status != CartStatus.fetching));
  const CartState({
    required this.status,
    this.errorMessage = '',
    this.totalPrice = 0,
    this.cartItems = const [],
    this.productModel = const [],
  });

  factory CartState.initial() {
    return const CartState(
      status: CartStatus.initial,
    );
  }

  CartState copyWith({
    required CartStatus status,
    String? errorMessage,
    int? totalPrice,
    final List<CartModel>? cartItems,
    List<ProductModel>? products,
  }) {
    return CartState(
      status: status,
      errorMessage: errorMessage ?? this.errorMessage,
      cartItems: cartItems ?? this.cartItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List get props => [status, errorMessage, cartItems];
}
