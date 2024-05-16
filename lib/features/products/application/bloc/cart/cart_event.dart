part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddToCart extends CartEvent {
  final CartModel cartModel;
  const AddToCart({required this.cartModel});

  @override
  List<Object?> get props => [];
}

class GetCart extends CartEvent {
  @override
  List<Object?> get props => [];
}

class RemoveFromCart extends CartEvent {
  final int id;
  const RemoveFromCart({required this.id});

  @override
  List<Object?> get props => [];
}

class OnOrder extends CartEvent {
  final int id;
  const OnOrder({required this.id});

  @override
  List<Object?> get props => [];
}

class OnQuantityChange extends CartEvent {
  final int id;
  final QuantityChangeType type;
  const OnQuantityChange({required this.id, required this.type});

  @override
  List<Object?> get props => [];
}

class ClearCart extends CartEvent {
  const ClearCart();

  @override
  List<Object?> get props => [];
}
