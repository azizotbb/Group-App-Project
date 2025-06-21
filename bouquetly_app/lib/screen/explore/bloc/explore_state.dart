part of 'explore_bloc.dart';

@immutable
sealed class ExploreState {}

final class ExploreInitial extends ExploreState {}
final class CarouselLoaded extends ExploreState{
final List<String> imagePaths;
  final int currentIndex;

  CarouselLoaded({required this.imagePaths, required this.currentIndex});


}
