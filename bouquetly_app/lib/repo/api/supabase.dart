import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseConnect {
  static Supabase? supabase;
  //tester

  static Supabase? admin;

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
      final AuthResponse user = await supabase!.client.auth.signUp(
        password: password,
        email: email,
        data: {'username': userName},
      );
      print("1");
      return user.user;
    } on AuthException catch (error) {
      print("2");

      throw AuthException(error.message);
    } catch (error) {
      print("3");

      throw FormatException("There is error with sign Up");
    }
  }

  //Supabase sign-in integration

  static Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse user = await supabase!.client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      return user.user;
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } catch (error) {
      throw FormatException("There is error with sign in");
    }
  }

  //add order
  static addOrder({
    required int ordernum,
    required int pricetotal,
    required String userid,
  }) async {
    await supabase?.client.from("orders").insert({
      "pricetotal": pricetotal,
      "ordernum": ordernum,
      "userid": userid,
    });
  }

  //Supabase sign-up integration
  static Future<dynamic> updateEmail({required String email}) async {
    try {
      await supabase!.client.auth.updateUser(UserAttributes(email: email));
      // final User? updatedUser = res.user;
    } on AuthException catch (error) {
      print("2");

      throw AuthException(error.message);
    } catch (error) {
      print("3");

      throw FormatException("There is error with sign Up");
    }
  }

  static Future<dynamic> deleteUser({required String userid}) async {
    try {
      await admin!.client.auth.admin.deleteUser(userid);
      // final User? updatedUser = res.user;
    } on AuthException catch (error) {
      print("2");

      throw AuthException(error.message);
    } catch (error) {
      print("3");

      throw FormatException("There is error with sign Up");
    }
  }
}
