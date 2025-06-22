part of 'order_bloc.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

class orderLoding extends OrderState{}

class orderSuccces extends OrderState{
  final List<dynamic> orders;

  orderSuccces({required this.orders}); 
  
}