part of 'customer_bloc.dart';

enum CustomerStatus {
  initial,
  fetching,
  fetched,
  exception,
  userCreated,
  userUpdated,
}

class CustomerState extends Equatable {
  final List<CustomerModel> customers;
  final CustomerStatus status;
  final CustomerModel? customer;
  final List<CustomerModel> searchCustomers;
  

  final String? errorMessage;
  bool get canShowNoData => ((status != CustomerStatus.fetching));
  const CustomerState({
    this.customers = const [],
    required this.status,
    this.errorMessage = '',
    this.customer,
    this.searchCustomers = const [],
   
  });

  factory CustomerState.initial() {
    return const CustomerState(
      status: CustomerStatus.initial,
    );
  }

  CustomerState copyWith({
    required CustomerStatus status,
    List<CustomerModel>? customers,
    String? errorMessage,
    CustomerModel? customer,
    List<CustomerModel>? searchCustomers,
  
  }) {
    return CustomerState(
      status: status,
      customers: customers ?? this.customers,
      errorMessage: errorMessage ?? this.errorMessage,
      customer: customer ?? this.customer,
      searchCustomers: searchCustomers ?? this.searchCustomers,
    
    );
  }

  @override
  List get props => [
        status,
        errorMessage,
      ];
}
