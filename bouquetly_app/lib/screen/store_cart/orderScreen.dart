import 'package:bouquetly_app/screen/store_cart/order/bloc/order_bloc.dart';
import 'package:bouquetly_app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc()..add(loadordersevent()),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 232, 228),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 236, 232, 228),
          title: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ListTile(
              title: Text(
                "Your Orders ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        body: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is orderLoding) {
              return Center(child: CircularProgressIndicator());
            } else if (state is orderSuccces) {
              final orders = state.orders;
              if (orders.isEmpty) {
                return Center(child: Text("no order"));
              }
              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    color: AppColors.lightBeige,
                    child: ListTile(
                      title: Text("order number : ${order["ordernum"]}"),
                      subtitle: Text("total price: ${order["pricetotal"]}"),
                    ),
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
