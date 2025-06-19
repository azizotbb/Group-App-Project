import 'package:bouquetly_app/model/itemModel.dart';
import 'package:bouquetly_app/widget/categoryWidget.dart';
import 'package:bouquetly_app/widget/itemWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 232, 228),
        title: Text(
          "BOUQUETLY",
          style: GoogleFonts.cormorantGaramond(
            fontSize: 50,
          ),
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
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryWidget(label: "Wrapped Bouquets"),
                CategoryWidget(label: "Box Bouquets"),
                CategoryWidget(label: "Basket Bouquets"),
                CategoryWidget(label: "Glass Vase"),
              ],
            ),
          ),
          const SizedBox(height: 20),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
            children: itemdata.map((e) {
              return Itemwidget(name: e.name, image: e.image, price: e.price);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
