part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SuccessState extends SignupState {}

final class ErrorState extends SignupState {
  final String msg;

  ErrorState({required this.msg});
}
