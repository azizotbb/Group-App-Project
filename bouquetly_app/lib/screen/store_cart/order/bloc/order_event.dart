part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

class orderevent extends OrderEvent{
  final List <String >orders; 
  final int pricetotal ;

  orderevent({required this.orders, required this.pricetotal}); 
}