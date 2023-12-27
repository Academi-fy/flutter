import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rotteck_messenger/di/dependency_injection.dart';
import 'package:rotteck_messenger/domain/repositories/user_account_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(loginButtonPressedEvent);
    on<ForgotButtonPressedEvent>(forgotButtonPressedEvent);
  }

  FutureOr<void> forgotButtonPressedEvent(
      ForgotButtonPressedEvent event, Emitter<LoginState> emit) {
    print("Forgot clicked");
  }

  FutureOr<void> loginButtonPressedEvent(
      LoginButtonPressedEvent event, Emitter<LoginState> emit) {
    Future<bool> status = getIt.get<UserAccountRepository>().authenticateUser(
          event.username,
          event.password,
        );

    if (status == true) {
      emit(LoginNavigateToChatPageActionState());
    } else {
      emit(LoginErrorState(message: "Login failed"));
    }
  }
}
