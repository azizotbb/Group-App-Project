part of 'pageview_bloc.dart';

@immutable
sealed class PageviewEvent {}

class GoToPageEvent extends PageviewEvent {
  final int index;

  GoToPageEvent({required this.index});
}
