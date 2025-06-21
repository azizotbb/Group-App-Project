part of 'pageview_bloc.dart';

@immutable
sealed class PageviewState {}

final class PageviewInitial extends PageviewState {
  final int currentPage;

  PageviewInitial({required this.currentPage});
}
