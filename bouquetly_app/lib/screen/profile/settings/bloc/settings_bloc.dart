import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bouquetly_app/repo/layer/auth/auth_layer.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final auth = GetIt.I.get<AuthLayer>();
  TextEditingController newEmail = TextEditingController();
  String confirmEmail = '';
  TextEditingController newName = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  final globalKeyEmail = GlobalKey<FormState>();

  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {});
    on<UpdateEmailEvent>(updateEmailMethod);
    on<DeleteAccountEvent>(deleteAccountMethod);
  }

  //update
  FutureOr<void> updateEmailMethod(
    UpdateEmailEvent event,
    Emitter<SettingsState> emit,
  ) {
    print('done');
    auth.updateEmail(email: confirmEmail);
    print('done');
    emit(SuccessState());
  }

  //delete
  FutureOr<void> deleteAccountMethod(
    DeleteAccountEvent event,
    Emitter<SettingsState> emit,
  ) {
    auth.deleteUser(GetIt.I.get<AuthLayer>().userID);
    print('Account Deleted');
  }
}
