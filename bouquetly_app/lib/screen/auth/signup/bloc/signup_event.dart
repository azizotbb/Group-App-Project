part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class CreateNewAccountEvent extends SignupEvent {}
