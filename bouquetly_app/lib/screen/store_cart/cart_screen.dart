import 'package:bouquetly_app/model/itemModel.dart';
import 'package:bouquetly_app/screen/store_cart/bloc/store_bloc.dart';
import 'package:bouquetly_app/screen/store_cart/order/bloc/order_bloc.dart';
import 'package:bouquetly_app/widget/bottomNavigation/bloc/bottom_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carrtitem = context.read<StoreBloc>().cartitem;
    int pricetotal = 0;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 232, 228),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 236, 232, 228),
        title: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ListTile(
            title: Text(
              "My Bag ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Divider(),
              BlocBuilder<StoreBloc, StoreState>(
                builder: (context, state) {
                  if (state is ShowCartocart) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: carrtitem.length,
                        itemBuilder: (context, index) {
                          final item = carrtitem[index];
                          return ListTile(
                            title: Text(item.name),
                            subtitle: Text("${item.price}"),
                            leading: Image.asset(item.image),
                            trailing: IconButton(
                              onPressed: () {
                                context.read<StoreBloc>().add(
                                  deleteItem(
                                    image: item.image,
                                    name: item.name,
                                    price: item.price,
                                  ),
                                );
                              },
                              icon: Icon(Icons.close),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(child: Text(" Nothig add yet "));
                  }
                },
              ),
              Spacer(),
              BlocBuilder<StoreBloc, StoreState>(
                builder: (context, state) {
                  if (state is ShowCartocart) {
                    final total = carrtitem.fold<int>(
                      0,
                      (sum, item) => sum + item.price,
                    );
                    pricetotal = total;
                    return Text(
                      "Total :${total}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
              ElevatedButton(
                //add discount button
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    backgroundColor: const Color.fromARGB(
                      255,
                      236,
                      232,
                      228,
                    ).withOpacity(0.9),
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Enter Discount Code",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Discount Code",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Apply",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "Add Discount",
                  style: TextStyle(color: Colors.black),
                ),
              ),

              BlocBuilder<StoreBloc, StoreState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        backgroundColor: const Color.fromARGB(
                          255,
                          236,
                          232,
                          228,
                        ).withOpacity(0.9),
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [Text("Total: $pricetotal"), SizedBox(height: 10,), ElevatedButton(onPressed: (){
                                final order=carrtitem.map((e){
                                  return e.name;
                                }).toList();
                                context.read<OrderBloc>().add(orderevent(orders: order, pricetotal: pricetotal,));
                              }, child: Text("Pay Now"))],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
