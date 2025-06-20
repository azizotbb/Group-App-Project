import 'package:bouquetly_app/style/app_colors.dart';
import 'package:bouquetly_app/widget/bottomNavigation/bloc/bottom_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<BottomNavigationBloc>();

          return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            builder: (context, state) {
              return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: bloc.selectIndex,

                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.brown,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.transparent,
                  ),

                  iconSize: 25,

                  onTap: (value) {
                    bloc.add(ChangeNavSelectEvent(index: value));
                  },

                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.explore),
                      label: "Explore",
                      backgroundColor: AppColors.darkBeige,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.store),
                      label: "Store",
                      backgroundColor: AppColors.darkBeige,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_bag),
                      label: "Cart",
                      backgroundColor: AppColors.darkBeige,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "Profile",
                      backgroundColor: AppColors.darkBeige,
                    ),
                  ],
                ),
                body: bloc.listWidget[bloc.selectIndex],
              );
            },
          );
        },
      ),
    );
  }
}
