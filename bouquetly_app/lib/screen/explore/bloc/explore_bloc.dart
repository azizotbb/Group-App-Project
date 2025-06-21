import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreInitial()) {
    on<LoadCarouselImages>(loadMethod);
    on<ChangeCarouselIndex>(changeMethod);
  }

  FutureOr<void> loadMethod(ExploreEvent event, Emitter<ExploreState> emit) {
    final images = [
      "assets/images/Bouquet1.jpg",
      "assets/images/Bouquet2.jpg",
      "assets/images/tulep.jpg",
      "assets/images/bokeh5.jpg",
    ];
    emit(CarouselLoaded(imagePaths: images, currentIndex: 0));
  }

  FutureOr<void> changeMethod(
    ChangeCarouselIndex event,
    Emitter<ExploreState> emit,
  ) {
    if (state is CarouselLoaded) {
      final currentState = state as CarouselLoaded;
      emit(
        CarouselLoaded(
          imagePaths: currentState.imagePaths,
          currentIndex: event.index,
        ),
      );
    }
  }
}
