import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
