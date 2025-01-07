import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/presentation/bloc/authentication_event.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/presentation/bloc/authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {
      //
    });

    on<LoginEvent>((event, emit) {
      //
    });
  }
}
