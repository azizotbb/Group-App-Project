import 'package:bouquetly_app/style/app_theme.dart';
import 'package:bouquetly_app/widget/bottomNavigation/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // test
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.appTheme,
      home: BottomNavigationWidget(),
    );
  }
}
