import 'package:bouquetly_app/repo/api/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderLayer {
  send({
    required int ordernum,
    required int pricetotal,
    required String userid,
  }) async {
    await SupabaseConnect.addOrder(
      ordernum: ordernum,
      pricetotal: pricetotal,
      userid: userid,
    );
  }

  getorders({required String userid}) async {
    return await SupabaseConnect.getOrderByUser(userid: userid);
  }
}
