part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

class orderevent extends OrderEvent{
 final int order_num; 
  final int pricetotal ;

  orderevent({required this.order_num, required this.pricetotal});

 
}