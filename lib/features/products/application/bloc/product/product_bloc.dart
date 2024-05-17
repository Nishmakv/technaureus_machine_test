import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_machine_test/common/common.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/products/products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState.initial()) {
    on<GetProduct>(_onFetchProducts);
    on<ProductSearch>(_onSearchProduct);
    on<NavItemChange>(_onNavItemChange);
    on<LoadCategories>(_loadCategory);
    on<SearchCategory>(_searchCategory);
    on<AddOrRemoveFav>(_addOrRemoveFav);
  }
  ProductRepository productRepository = ProductRepository();

  void _loadCategory(
    LoadCategories event,
    Emitter<ProductState> emit,
  ) {
    emit(state.copyWith(
      status: ProductStatus.fetching,
      searchCategories: categoriesData,
      categories: categoriesData,
    ));
  }

  void _addOrRemoveFav(
    AddOrRemoveFav event,
    Emitter<ProductState> emit,
  ) {
    if (state.favoriteItems.contains(event.id)) {
      final updatedItems =
          state.favoriteItems.where((id) => id != event.id).toList();
      emit(state.copyWith(
        status: ProductStatus.loved,
        favoriteItems: updatedItems,
      ));
      return;
    }
    final items = [...state.favoriteItems, event.id];
    emit(state.copyWith(
      status: ProductStatus.loved,
      favoriteItems: items,
    ));
  }

  void _searchCategory(
    SearchCategory event,
    Emitter<ProductState> emit,
  ) {
    List<Categories> filteredCategories;
    if (state.searchCategories.isEmpty) {
      filteredCategories = List.from(state.categories);
    } else {
      filteredCategories = state.categories
          .where((category) => category.name
              .toLowerCase()
              .contains(event.searchQuery.toLowerCase()))
          .toList();
    }

    emit(state.copyWith(
      status: ProductStatus.categoriesSearched,
      searchCategories: filteredCategories,
    ));
  }

  Future<void> _onFetchProducts(
    GetProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.fetching));

    try {
      final Result response = await productRepository.getProducts();
      if (response.success == true) {
        emit(state.copyWith(
          status: ProductStatus.fetched,
          products: response.data ?? [],
        ));
      } else {
        emit(state.copyWith(
          status: ProductStatus.exception,
          errorMessage: response.error ?? "Unknown error",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: ProductStatus.exception,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onSearchProduct(
    ProductSearch event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.fetching));
    try {
      final Result response =
          await productRepository.productSearch(event.searchQuery);
      if (response.success == true) {
        emit(state.copyWith(
          status: ProductStatus.fetched,
          searchProducts: response.data ?? [],
        ));
      } else {
        emit(state.copyWith(
          status: ProductStatus.exception,
          errorMessage: response.error ?? "Unknown error",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: ProductStatus.exception,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onNavItemChange(
    NavItemChange event,
    Emitter<ProductState> emit,
  ) {
    emit(state.copyWith(
      status: ProductStatus.navIndexChanged,
      navIndex: event.navIndex,
    ));
  }
}
