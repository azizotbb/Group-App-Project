part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}


class UpdateEmailEvent extends SettingsEvent{}
class DeleteAccountEvent extends SettingsEvent{}