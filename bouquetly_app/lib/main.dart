import 'package:bouquetly_app/repo/api/supabase.dart';
import 'package:bouquetly_app/screen/splash/splash_screen.dart';
import 'package:bouquetly_app/style/app_theme.dart';
import 'package:bouquetly_app/utility/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // to Initialized supabase
  await SupabaseConnect.init();

  setup();

  // Only orientation for this app is Portia up
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());

  // Enable verbose logging for debugging (remove in production)
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // Initialize with your OneSignal App ID
  OneSignal.initialize("ae906282-b83e-4976-b807-db3c90608b6b");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}
