part of 'explore_bloc.dart';

@immutable
sealed class ExploreEvent {}

class ChangeCarouselIndex extends ExploreEvent {
  final int index;

  ChangeCarouselIndex({required this.index});
}
class LoadCarouselImages extends ExploreEvent{}


