import 'package:bouquetly_app/extension/app_size.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:flutter/material.dart';

class PageViewThree extends StatelessWidget {
  const PageViewThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            width: context.getWidth() * 0.9,
            height: context.getHight() * 0.6,
            color: Colors.white.withOpacity(0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text("BOUQUETLY", style: AppTextStyle.logoText),
                const SizedBox(height: 10),
                const Text(
                  "Contacts\n",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.facebook),
                  ),
                  title: Text("www.facebook.com"),
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.phone),
                  ),
                  title: Text("0505148364"),
                ),
                 ListTile(
                  leading: IconButton(onPressed: () {}, icon: Icon(Icons.mail)),
                  title: Text("Bouquetly.gmail.com"),
                ),
                 ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.snapchat),
                  ),
                  title: Text("Bouquetly"),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
