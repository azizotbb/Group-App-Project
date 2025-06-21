import 'dart:math';

import 'package:bouquetly_app/model/itemModel.dart';
import 'package:bouquetly_app/screen/store_cart/bloc/store_bloc.dart';
import 'package:bouquetly_app/screen/store_cart/order/bloc/order_bloc.dart';
import 'package:bouquetly_app/style/app_colors.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
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

              BlocBuilder<StoreBloc, StoreState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: () {
                      final order_num = Random().nextInt(10000);
                      context.read<OrderBloc>().add(
                        orderevent(
                          order_num: order_num,
                          pricetotal: pricetotal,
                        ),
                      );
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: AppColors.lightBeige,
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/images/Online Groceries-rafiki.png',
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Order Successful!',
                                    style: AppTextStyle.headerText,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Your order has been placed successfully.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //       "Your order has been placed successfully",
                      //       style: TextStyle(color: Colors.black),
                      //     ),
                      //     duration: Duration(seconds: 3),
                      //     backgroundColor: AppColors.darkBeige,
                      //   ),
                      // );
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



// Text("Total: $pricetotal")

//  final order=carrtitem.map((e){
//                                   return e.name;
//                                 }).toList();
//                                 context.read<OrderBloc>().add(orderevent(orders: order, pricetotal: pricetotal,));