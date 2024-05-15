part of 'product_bloc.dart';

enum ProductStatus {
  initial,
  fetching,
  fetched,
  exception,
  navIndexChanged,
}

class ProductState extends Equatable {
  final List<ProductModel> products;
  final ProductStatus status;
  final ProductModel? product;
  final List<ProductModel> searchProducts;
  final int navIndex;

  final String? errorMessage;
  bool get canShowNoData => ((status != ProductStatus.fetching));
  const ProductState({
    this.products = const [],
    required this.status,
    this.errorMessage = '',
    this.product,
    this.searchProducts = const [],
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
    int? navIndex,
  }) {
    return ProductState(
      status: status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      product: product ?? this.product,
      searchProducts: searchProducts ?? this.searchProducts,
      navIndex: navIndex ?? this.navIndex,
    );
  }

  @override
  List get props => [
        status,
        errorMessage,
      ];
}
