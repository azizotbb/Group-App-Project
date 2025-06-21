part of 'store_bloc.dart';

@immutable
sealed class StoreEvent {}
class showitem extends StoreEvent{
   final String image ;
  final String name;
  final int price;

  showitem({required this.image, required this.name, required this.price});
}

class additem extends StoreEvent{
  final String image ;
  final String name;
  final int price;

  additem({required this.image, required this.name, required this.price}); 
}


class deleteItem extends StoreEvent{
   final String image ;
  final String name;
  final int price;

  deleteItem({required this.image, required this.name, required this.price});
}

class UpdateSearchQuery extends StoreEvent {
  final String searchtext;
  UpdateSearchQuery(this.searchtext);
}

class UpdateCategory extends StoreEvent{
  final String categorychose;

  UpdateCategory({required this.categorychose}); 
  
}