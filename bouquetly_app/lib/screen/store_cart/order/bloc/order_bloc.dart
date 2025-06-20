import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<orderevent>(sendorder);
  }

  FutureOr<void> sendorder(orderevent event, Emitter<OrderState> emit) {
    emit(orderLoding());
     

  }
}
