import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bouquetly_app/screen/store_cart/cart_screen.dart';
import 'package:bouquetly_app/screen/explore/explore_screen.dart';
import 'package:bouquetly_app/screen/profile/profile_screen.dart';
import 'package:bouquetly_app/screen/store_cart/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  // Index of the selected item in the bottom navigation

  int selectIndex = 0;

  // List of screens shown when changing bottom navigation

  List<Widget> listWidget = [
    ExploreScreen(),
    StoreScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  BottomNavigationBloc() : super(BottomNavigationInitial()) {
    on<ChangeNavSelectEvent>(ChangeNavSelectMethod);
  }

  FutureOr<void> ChangeNavSelectMethod(
    ChangeNavSelectEvent event,
    Emitter<BottomNavigationState> emit,
  ) {
    selectIndex = event.index;
    emit(RefreshUIState());
  }
}
