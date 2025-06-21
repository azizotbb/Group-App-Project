import 'package:bouquetly_app/repo/api/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLayer {
  // Stores the authenticated user's ID and username after successful sign-up
  String userID = "";
  String username = "";

  // Stores additional user information
  Map userInfo = {};

  /// Method to sign up a new user using email, password, and name.
  ///
  /// - Sends the data to Supabase through the SupabaseConnect.signUp method.
  /// - On success, it stores the user ID and metadata.
  /// - On failure, it throws either an AuthException (for Supabase-specific errors)
  ///   or a FormatException (for other errors).
  signUpMethod({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await SupabaseConnect.signUp(
        email: email,
        password: password,
        userName: name,
      );
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  //Signs in an existing user with email and password.

  signInMethod({required String email, required String password}) async {
    try {
      final user = await SupabaseConnect.signIn(
        email: email,
        password: password,
      );
      userID = user.id;
      userInfo = user.userMetadata;
      username = user.userMetadata["username"];

      return user;
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  updateEmail({required String email}) async{
       try {
       await SupabaseConnect.updateEmail(
        
        email: email,
        
      );
      
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
  deleteUser(String id) async{
       try {
       await SupabaseConnect.deleteUser(
        
        userid: userID,
        
      );
      
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
  
}

