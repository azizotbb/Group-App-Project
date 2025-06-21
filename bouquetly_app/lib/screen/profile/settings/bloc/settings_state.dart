part of 'settings_bloc.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}
final class SuccessState extends SettingsState {}
final class ErrorState extends SettingsState {}
final class LoadingState extends SettingsState {}
