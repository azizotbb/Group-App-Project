import 'package:bouquetly_app/screen/explore/bloc/explore_bloc.dart';
import 'package:bouquetly_app/screen/location/location.dart';
import 'package:bouquetly_app/screen/pageview/page_view.dart';
import 'package:bouquetly_app/style/app_colors.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:bouquetly_app/widget/custom_explore_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExploreBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<ExploreBloc>();
          bloc.add(LoadCarouselImages());
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageViewBasic(),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.inventory),
                    title: Text("Store Location"),
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Location(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Width: ${context.getWidth()} and Height: ${context.getHight()}',
                    // ),
                    Text('New', style: AppTextStyle.headerText),
                    SizedBox(height: 10),

                    BlocBuilder<ExploreBloc, ExploreState>(
                      builder: (context, state) {
                        if (state is CarouselLoaded) {
                          return Center(
                            child: CarouselSlider(
                              items: state.imagePaths.map((path) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(path, fit: BoxFit.fill),
                                );
                              }).toList(),

                              options: CarouselOptions(
                                height: 350,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 8),
                                autoPlayAnimationDuration: Duration(
                                  milliseconds: 900,
                                ),
                                viewportFraction: 2,
                                onPageChanged: (index, reason) {
                                  bloc.add(ChangeCarouselIndex(index: index));
                                },
                              ),
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
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
        },
      ),
    );
  }
}
