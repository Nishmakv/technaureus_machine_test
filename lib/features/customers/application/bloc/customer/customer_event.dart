part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object?> get props => [];
}

class GetCustomer extends CustomerEvent {
  const GetCustomer();

  @override
  List<Object?> get props => [];
}

class GetCustomerById extends CustomerEvent {
  final int id;
  const GetCustomerById({required this.id});

  @override
  List<Object?> get props => [];
}

class CustomerSearch extends CustomerEvent {
  final String searchQuery;
  const CustomerSearch({required this.searchQuery});

  @override
  List<Object?> get props => [];
}

class CreateCustomer extends CustomerEvent {
  final CustomerRequestModel createCustomer;
  const CreateCustomer({required this.createCustomer});

  @override
  List<Object?> get props => [];
}

class UpdateCustomer extends CustomerEvent {
  final CustomerRequestModel updateCustomer;
  final int id;
  const UpdateCustomer({required this.updateCustomer,required this.id});

  @override
  List<Object?> get props => [];
}
