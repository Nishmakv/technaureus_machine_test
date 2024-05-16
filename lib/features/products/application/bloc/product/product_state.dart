part of 'product_bloc.dart';

enum ProductStatus {
  initial,
  fetching,
  loved,
  removedfromfav,
  fetched,
  exception,
  categoriesSearched,
  navIndexChanged,
}

class ProductState extends Equatable {
  final List<ProductModel> products;
  final ProductStatus status;
  final ProductModel? product;
  final List<ProductModel> searchProducts;
  final int navIndex;
  final List<Categories> categories;
  final List<Categories> searchCategories;
  final List<int> favoriteItems;
  final String? errorMessage;
  bool get canShowNoData => ((status != ProductStatus.fetching));
  const ProductState({
    this.products = const [],
    required this.status,
    this.errorMessage = '',
    this.product,
    this.searchProducts = const [],
    this.favoriteItems = const [],
    this.categories = const [],
    this.searchCategories = const [],
    this.navIndex = 0,
  });

  factory ProductState.initial() {
    return const ProductState(
      status: ProductStatus.initial,
    );
  }

  ProductState copyWith({
    required ProductStatus status,
    List<ProductModel>? products,
    String? errorMessage,
    ProductModel? product,
    List<ProductModel>? searchProducts,
    List<Categories>? categories,
    List<Categories>? searchCategories,
    List<int>? favoriteItems,
    int? navIndex,
  }) {
    return ProductState(
      status: status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      categories: categories ?? this.categories,
      product: product ?? this.product,
      searchProducts: searchProducts ?? this.searchProducts,
      searchCategories: searchCategories ?? this.searchCategories,
      favoriteItems: favoriteItems ?? this.favoriteItems,
      navIndex: navIndex ?? this.navIndex,
    );
  }

  @override
  List get props => [
        navIndex,
        status,
        favoriteItems,
        categories,
        searchCategories,
        errorMessage,
      ];
}
