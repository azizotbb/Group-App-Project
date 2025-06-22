import 'package:bouquetly_app/extension/app_size.dart';
import 'package:bouquetly_app/screen/store_cart/orderScreen.dart';
import 'package:bouquetly_app/style/app_colors.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:bouquetly_app/widget/custom_explore_item.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBeige,
      appBar: AppBar(
        backgroundColor: AppColors.darkBeige,
        title: Text('BOUQUETLY', style: AppTextStyle.logoText),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: AppColors.lightBeige,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white),
                  SizedBox(width: 20),
                  Text("Raghad Alsaykhain"),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us and Contacts"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //   ),
                // );
              },
            ),

            ListTile(
              leading: Icon(Icons.inventory),
              title: Text("Your Order"),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("your order"),
              onTap: (){
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Orderscreen()),
                );
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Width: ${context.getWidth()} and Height: ${context.getHight()}',
              ),
              Text('New', style: AppTextStyle.headerText),
              SizedBox(height: 10),

              // Container(
              //   height: context.getHight() / 2.9,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(50),
              //     color: AppColors.darkBeige,
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(20),
              //     child: Image.asset(
              //       "assets/images/Bouquet1.jpg",
              //       fit: BoxFit.contain,
              //     ),
              //   ),
              // ),
              SizedBox(height: 30),
              Text("Most Popular", style: AppTextStyle.headerText),
              SizedBox(height: 10),

              CustomExploreItem(
                name: 'White Tulip ',
                image: 'assets/images/boqet.png',
                desc:
                    'A symbol of purity and\npeace.Perfect for fresh,\nelegant moments.',
              ),
              CustomExploreItem(
                name: 'Pink Spray\nRoses ',
                image: 'assets/images/exploreboqe.png',
                desc: 'Soft and sweet.Expresses \nlove and gentle care.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
