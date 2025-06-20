import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bouquetly_app/model/itemModel.dart';
import 'package:meta/meta.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  List<Itemmodel> items = [];
  // the all item
  List<Itemmodel> allitems = [];
  //item show on cart
  List<Itemmodel> cartitem = [];
  //varible take the input value from the user
  String searchQuery = "";
  String category = "All";
  StoreBloc() : super(StoreInitial()) {
    on<additem>(addItemToCart);
    on<deleteItem>(deleteItemFromCart);
    on<UpdateSearchQuery>(searchitem);
    on<UpdateCategory>(chosecategory);
    // on<showitem>(showiteminstore);
    Data();
  }
  //function return list
  List<Itemmodel> filteritem() {
    // if (searchQuery.isEmpty) return allitems;
    // return allitems
    //     .where(
    //       (item) => item.name.toLowerCase().trim().contains(
    //         searchQuery.toLowerCase().trim(),
    //       ),
    //     )
    //     .toList();
    print("current category = $category");
    print("all category");
    if (searchQuery.isEmpty && category.toLowerCase() == "all") {
      return allitems;
    }
    return allitems.where((item) {
      final isserchmatch = item.name.toLowerCase().trim().contains(
        searchQuery.toLowerCase().trim(),
      );
      final iscategorymatch =
          category.toLowerCase().trim() == "all" ||
          item.category!.toLowerCase().trim() == category.toLowerCase().trim();
      return isserchmatch && iscategorymatch;
    }).toList();
  }

  // function to init data and add the data to list to show on store
  void Data() {
    final itemdata = [
      Itemmodel(
        image: "assets/images/flower.png",
        name: "Lily Charm",
        price: 50,
        category: 'Wrapped Bouquet',
      ),
      Itemmodel(
        image: "assets/images/exbo.png",
        name: "Pink Tulip",
        price: 50,
        category: 'Wrapped Bouquet',
      ),
      Itemmodel(
        image: "assets/images/boqetex.png",
        name: "Blush Lily",
        price: 55,
        category: 'Wrapped Bouquet',
      ),
      Itemmodel(
        image: "assets/images/boqet3.png",
        name: "Rose Charm",
        price: 40,
        category: 'Wrapped Bouquet',
      ),
      Itemmodel(
        image: "assets/images/boxbo.png",
        name: "pink Rose",
        price: 50,
        category: 'Box Bouquet',
      ),
      Itemmodel(
        image: "assets/images/vase.png",
        name: "Vasa Bloom",
        price: 150,
        category: 'Glass Vase',
      ),
    ];
    items.addAll(itemdata);
    allitems.addAll(itemdata);
    add(UpdateSearchQuery(""));
  }

  //add item to cart
  FutureOr<void> addItemToCart(additem event, Emitter<StoreState> emit) {
    final Itemmodel newitem = Itemmodel(
      image: event.image,
      name: event.name,
      price: event.price,
    );
    cartitem.add(newitem);
    emit(
      ShowCartocart(
        itemsOnCart: filteritem(),

        // totalprice: total,
      ),
    );
  }

  // delete item from cart
  FutureOr<void> deleteItemFromCart(
    deleteItem event,
    Emitter<StoreState> emit,
  ) {
    final index = cartitem.indexWhere(
      (item) =>
          item.image == event.image &&
          item.name == event.name &&
          item.price == event.price,
    );
    if (index != -1) {
      cartitem.removeAt(index);
    }

    emit(ShowCartocart(itemsOnCart: items));
  }

  //  show store item based on search
  FutureOr<void> searchitem(UpdateSearchQuery event, Emitter<StoreState> emit) {
    searchQuery = event.searchtext;
    // if (searchQuery.isEmpty) {
    //   emit(ShowCartocart(itemsOnCart: allitems, searchQuery: searchQuery));
    // }
    final filteredItems = filteritem();

    emit(ShowCartocart(itemsOnCart: filteredItems, searchQuery: searchQuery));
  }

  FutureOr<void> chosecategory(UpdateCategory event, Emitter<StoreState> emit) {
    category = event.categorychose;
    final filteredItems = filteritem();

    emit(ShowCartocart(itemsOnCart: filteredItems));
  }
}
