import 'package:bouquetly_app/repo/layer/auth/auth_layer.dart';
import 'package:bouquetly_app/repo/layer/order_layer.dart';
import 'package:get_it/get_it.dart';

void setup() {
  // GetIt.I.registerSingleton<AppModel>(AppModel());
  GetIt.I.registerSingleton<AuthLayer>(AuthLayer());
  GetIt.I.registerSingleton<OrderLayer>(OrderLayer());
}
