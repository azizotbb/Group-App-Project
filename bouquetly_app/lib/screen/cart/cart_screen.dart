import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Spacer(),
              Text(
                "Total",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {},
                child: Text("Checkout", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
