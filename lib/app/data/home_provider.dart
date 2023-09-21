import 'package:get/get.dart';
import 'package:presensimob/app/models/get_presensi_response.dart';
import 'package:sp_util/sp_util.dart';

class HomeProvider extends GetConnect {
  // Post request
  Future<GetPresensiResponse?> getPresensiResponse() async {
    try {
      var token = SpUtil.getString('token', defValue: '');

      var response =
          await get("http://36.64.224.194:8999/api/get-presensi", headers: {
        "Authorization": "Bearer $token",
      });

      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! <= 404) {
          return GetPresensiResponse.fromJson(response.body);
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
