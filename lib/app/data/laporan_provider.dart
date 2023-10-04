import 'package:get/get.dart';
import 'package:presensimob/app/models/laporan_response.dart';
import 'package:sp_util/sp_util.dart';

class LaporanProvider extends GetConnect {
  // Post request
  Future<LaporanResponse?> getLaporanPreensi() async {
    try {
      var token = SpUtil.getString('token', defValue: '');

      var response =
          await get("http://36.64.224.194:8999/api/laporan", headers: {
        "Authorization": "Bearer $token",
      });

      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! <= 404) {
          return LaporanResponse.fromJson(response.body);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('error $e');
      return null;
    }
  }
}
