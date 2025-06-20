part of 'store_bloc.dart';

@immutable
sealed class StoreState {}

final class StoreInitial extends StoreState {}

// final class Showitemonstore extends StoreState{
//   final List <Itemmodel> itemonstore;

//   Showitemonstore({required this.itemonstore});
// }

final class ShowCartocart extends StoreState{
  final List <Itemmodel> itemsOnCart;
  final String? searchQuery;
  final int? totalprice;

  ShowCartocart({required this.itemsOnCart,  this.searchQuery,  this.totalprice}); 
}