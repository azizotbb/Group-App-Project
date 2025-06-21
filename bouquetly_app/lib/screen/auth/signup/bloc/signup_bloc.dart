import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bouquetly_app/repo/layer/auth/auth_layer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  //Sign-up controllers to receive user inputs"
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Access AuthLayer instance using GetIt for authentication handling
  final authGetit = GetIt.I.get<AuthLayer>();

  SignupBloc() : super(SignupInitial()) {
    on<CreateNewAccountEvent>(createNewAccountMethod);
  }

  /// Method to handle the sign-up process when CreateNewAccountEvent is triggered
  ///
  /// It takes the user input from the controllers and calls the AuthLayer's signUpMethod.
  /// If successful, it emits a SuccessState. If an error occurs, it emits an ErrorState.
  FutureOr<void> createNewAccountMethod(
    CreateNewAccountEvent event,
    Emitter<SignupState> emit,
  ) async {
    try {
      await authGetit.signUpMethod(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      emit(SuccessState());
    } on AuthException catch (error) {
      log(error.message);
      emit(ErrorState(msg: error.message));
    } catch (_) {}
  }
}
