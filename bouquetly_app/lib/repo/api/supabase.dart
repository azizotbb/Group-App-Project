import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseConnect {
  static Supabase? supabase;

  static Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");

      supabase = await Supabase.initialize(
        url: dotenv.env["baseURL"].toString(),
        anonKey: dotenv.env["anonKey"].toString(),
      );
      log("Successfully connected to Supabase 🎉");
    } catch (error) {
      throw FormatException("There is error with connecting");
    }
  }
}
