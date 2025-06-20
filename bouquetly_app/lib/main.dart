import 'package:bouquetly_app/repo/api/supabase.dart';
import 'package:bouquetly_app/screen/splash/splash_screen.dart';
import 'package:bouquetly_app/style/app_theme.dart';
import 'package:bouquetly_app/utility/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // to Initialized supabase
  await SupabaseConnect.init();

  setup();

  // Only orientation for this app is Portia up
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}
