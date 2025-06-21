import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bouquetly_app/repo/layer/auth/auth_layer.dart';
import 'package:bouquetly_app/repo/layer/order_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final ordergetit = GetIt.I.get<OrderLayer>();
  final authgetit = GetIt.I.get<AuthLayer>();
  OrderBloc() : super(OrderInitial()) {
    on<orderevent>(sendorder);
  }

  FutureOr<void> sendorder(orderevent event, Emitter<OrderState> emit) async {
    emit(orderLoding());
    await ordergetit.send(
      ordernum: event.order_num,
      pricetotal: event.pricetotal,
      userid: authgetit.userID,
    );
    emit(orderSuccces());
  }
}
