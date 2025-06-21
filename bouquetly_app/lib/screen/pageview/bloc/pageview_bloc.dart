import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'pageview_event.dart';
part 'pageview_state.dart';

class PageviewBloc extends Bloc<PageviewEvent, PageviewState> {
  final PageController controller = PageController();
  PageviewBloc() : super(PageviewInitial(currentPage: 0)) {
    on<GoToPageEvent>(moveMethod);
  }

  FutureOr<void> moveMethod(GoToPageEvent event, Emitter<PageviewState> emit) {
    emit(PageviewInitial(currentPage: event.index));
  }
}
