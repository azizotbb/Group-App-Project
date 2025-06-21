import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bouquetly_app/repo/layer/auth/auth_layer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  //Sign-up controllers to receive user inputs"
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Key to manage and validate the form state
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Access AuthLayer instance using GetIt for authentication handling
  final authGetit = GetIt.I.get<AuthLayer>();

  SigninBloc() : super(SigninInitial()) {
    on<LogInEvent>(logInMethod);
  }

  // Method to handle the login logic
  FutureOr<void> logInMethod(
    LogInEvent event,
    Emitter<SigninState> emit,
  ) async {
    try {
      await authGetit.signInMethod(
        email: emailController.text,
        password: passwordController.text,
      );

      emit(SuccessState());
      print(authGetit.userID);
      print(authGetit.userInfo);
    } on AuthException catch (error) {
      log(error.message);
      emit(ErrorState(msg: error.message));
    } catch (_) {}
  }
}
