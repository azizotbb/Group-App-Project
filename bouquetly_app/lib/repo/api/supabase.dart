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

  //Supabase sign-up integration
  static Future<dynamic> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      print("-------------------------------------------------------");
      final AuthResponse user = await supabase!.client.auth.signUp(
        password: password,
        email: email,
        data: {'username': userName},
      );
      return user.user;
    } on AuthException catch (error) {
      print("4");

      throw AuthException(error.message);
    } catch (error) {
      throw FormatException("There is error with sign Up");
    }
  }


//   static Future<dynamic> update({required String email}) async{
//     final UserResponse res = await supabase!.client.auth.updateUser(
//   UserAttributes(
//     email: email,
//   ),
// );
// // final User? updatedUser = res.user;
  // }
}
