import 'package:bouquetly_app/model/itemModel.dart';
import 'package:bouquetly_app/screen/store_cart/bloc/store_bloc.dart';
import 'package:bouquetly_app/widget/categoryWidget.dart';
import 'package:bouquetly_app/widget/itemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 232, 228),
        title: Text(
          "BOUQUETLY",
          style: GoogleFonts.cormorantGaramond(fontSize: 50),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 40),
          SearchBar(
            backgroundColor: const WidgetStatePropertyAll(Colors.white),
            hintText: 'Search for a Bouquet',
            elevation: const WidgetStatePropertyAll(0),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.grey, width: 1.5),
              ),
            ),
            onChanged: (value) {
              context.read<StoreBloc>().add(UpdateSearchQuery(value));
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<StoreBloc>().add(
                      UpdateCategory(categorychose: "All"),
                    );
                  },
                  child: CategoryWidget(label: "All"),
                ),

                GestureDetector(
                  onTap: () {
                    context.read<StoreBloc>().add(
                      UpdateCategory(categorychose: "Wrapped Bouquet"),
                    );
                  },
                  child: CategoryWidget(label: "Wrapped Bouquet"),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<StoreBloc>().add(
                      UpdateCategory(categorychose: "Box Bouquet"),
                    );
                  },
                  child: CategoryWidget(label: "Box Bouquet"),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<StoreBloc>().add(
                      UpdateCategory(categorychose: "Basket Bouquet"),
                    );
                  },
                  child: CategoryWidget(label: "Basket Bouquet"),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<StoreBloc>().add(
                      UpdateCategory(categorychose: "Glass Vase"),
                    );
                  },
                  child: CategoryWidget(label: "Glass Vase"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          BlocBuilder<StoreBloc, StoreState>(
            builder: (context, state) {
              if (state is ShowCartocart) {
                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.65,
                  children: state.itemsOnCart.map((e) {
                    return Itemwidget(
                      name: e.name,
                      image: e.image,
                      price: e.price,
                      category: e.category!,
                    );
                  }).toList(),
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
