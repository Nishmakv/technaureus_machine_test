import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_machine_test/core/network/base_result.dart';
import 'package:technaureus_machine_test/features/customers/domain/domain.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(CustomerState.initial()) {
    on<GetCustomer>(_onFetchCustomers);
    on<CustomerSearch>(_onSearchCustomer);
    on<CreateCustomer>(_onCreateCustomer);
  }
  CustomerRepository customerRepository = CustomerRepository();
  Future<void> _onFetchCustomers(
    GetCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    emit(state.copyWith(status: CustomerStatus.fetching));

    try {
      final Result response = await customerRepository.getCustomers();
      if (response.success ?? false) {
        emit(state.copyWith(
          status: CustomerStatus.fetched,
          customers: response.data ?? [],
          searchCustomers: response.data ?? [],
        ));
      } else {
        emit(state.copyWith(
          status: CustomerStatus.exception,
          errorMessage: response.error ?? "Unknown error",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: CustomerStatus.exception,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onSearchCustomer(
    CustomerSearch event,
    Emitter<CustomerState> emit,
  ) async {
    emit(state.copyWith(status: CustomerStatus.fetching));
    try {
      if (event.searchQuery.isEmpty) {
        emit(state.copyWith(
          status: CustomerStatus.fetched,
          searchCustomers: state.customers,
        ));
      }
      final  response =
          await customerRepository.customerSearch(event.searchQuery);
      if (response.success ?? false) {
        emit(state.copyWith(
          status: CustomerStatus.fetched,
          searchCustomers: response.data ?? [],
        ));
      } else {
        emit(state.copyWith(
          status: CustomerStatus.exception,
          errorMessage: response.error ?? "Unknown error",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: CustomerStatus.exception,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onCreateCustomer(
    CreateCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    emit(state.copyWith(status: CustomerStatus.fetching));
    try {
      final Result response = await customerRepository.createCustomer(
          customerRequestModel: event.createCustomer);
      if (response.success ?? false) {
        emit(state.copyWith(
          status: CustomerStatus.userCreated,
        ));
      } else {
        emit(state.copyWith(
          status: CustomerStatus.exception,
          errorMessage: response.error ?? "Unknown error",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: CustomerStatus.exception,
        errorMessage: 'An error occurred',
      ));
    }
  }
}
