import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void setup() {
  // GetIt.I.registerSingleton<AppModel>(AppModel());
GetIt.I.registerLazySingleton<SupabaseClient>(()=>Supabase.instance.client);

}
