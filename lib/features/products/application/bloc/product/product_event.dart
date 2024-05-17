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


class ProductSearch extends ProductEvent {
  final String searchQuery;
  const ProductSearch({required this.searchQuery});

  @override
  List<Object?> get props => [];
}

class AddOrRemoveFav extends ProductEvent {
  final int id;
  const AddOrRemoveFav( this.id);

  @override
  List<Object?> get props => [];
}

class NavItemChange extends ProductEvent {
  final int navIndex;
  const NavItemChange({required this.navIndex});

  @override
  List<Object?> get props => [];
}

class LoadCategories extends ProductEvent {
  const LoadCategories();

  @override
  List<Object?> get props => [];
}

class SearchCategory extends ProductEvent {
  final String searchQuery;
  const SearchCategory(this.searchQuery);

  @override
  List<Object?> get props => [];
}
