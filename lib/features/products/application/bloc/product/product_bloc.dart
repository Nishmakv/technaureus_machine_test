import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_machine_test/core/network/base_result.dart';
import 'package:technaureus_machine_test/features/products/domain/models/models.dart';

import 'package:technaureus_machine_test/features/products/domain/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository})
      : super(ProductState.initial()) {
    on<GetProduct>(_onFetchProducts);
    on<GetProductById>(_onFetchProduct);
    on<ProductSearch>(_onSearchProduct);
    on<NavItemChange>(_onNavItemChange);
    
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

  Future<void> _onFetchProduct(
    GetProductById event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.fetching));
    try {
      final Result response = await productRepository.getProductById(event.id);
      if (response.success == true) {
        emit(state.copyWith(
          status: ProductStatus.fetched,
          product: response.data ?? [],
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
