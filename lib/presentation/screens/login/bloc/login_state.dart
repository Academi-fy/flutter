part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

sealed class LoginActionState extends LoginState {}

final class LoginInitial extends LoginState {}

class LoginNavigateToChatPageActionState extends LoginActionState {}

class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({required this.message});
}
