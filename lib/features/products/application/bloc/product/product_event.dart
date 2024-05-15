part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class GetProduct extends ProductEvent {
  const GetProduct();

  @override
  List<Object?> get props => [];
}

class GetProductById extends ProductEvent {
  final int id;
  const GetProductById({required this.id});

  @override
  List<Object?> get props => [];
}

class ProductSearch extends ProductEvent {
  final String searchQuery;
  const ProductSearch({required this.searchQuery});

  @override
  List<Object?> get props => [];
}

class NavItemChange extends ProductEvent {
  final int navIndex;
  const NavItemChange({required this.navIndex});

  @override
  List<Object?> get props => [];
}
