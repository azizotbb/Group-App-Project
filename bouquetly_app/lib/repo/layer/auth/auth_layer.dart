import 'package:bouquetly_app/repo/api/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLayer {
  // Stores the authenticated user's ID after successful sign-up
  String? userID;

  // Stores additional user information
  Map? userInfo;

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
      final user = await SupabaseConnect.signUp(
        email: email,
        password: password,
        userName: name,
      );
      // Store user ID and metadata on successful registration

      userID = user.id;
      userInfo = user.userMetadata;
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
}
