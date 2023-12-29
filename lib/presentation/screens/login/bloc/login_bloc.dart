import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<ForgotButtonPressedEvent>(forgotButtonPressedEvent);
  }

  FutureOr<void> forgotButtonPressedEvent(
      ForgotButtonPressedEvent event, Emitter<LoginState> emit) {
    print("Forgot clicked");
  }
}
