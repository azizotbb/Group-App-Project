import 'package:bouquetly_app/repo/api/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditLayer {

  String? userID;

  // Stores additional user information
  Map? userInfo;
  
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


