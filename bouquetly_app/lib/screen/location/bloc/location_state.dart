part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

class SuccessState extends LocationState {
  final Set<Marker> markers;
  SuccessState({required this.markers});
}
