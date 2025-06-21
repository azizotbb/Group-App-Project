part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SuccessState extends SigninState {}

final class ErrorState extends SigninState {
  final String msg;

  ErrorState({required this.msg});
}
