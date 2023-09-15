import 'package:get/get.dart';
import 'package:presensimob/app/models/presensi_request.dart';
import 'package:presensimob/app/models/presensi_response.dart';
import 'package:sp_util/sp_util.dart';

class PresensiProvider extends GetConnect {
  // Post request
  Future<PresensiResponse?> sentPresensiLocation(
      {required PresensiRequest data}) async {
    try {
      var token = SpUtil.getString('token', defValue: '');

      var response = await post(
          "http://36.64.224.194:8999/api/masuk-presensi", data.toMap(),
          headers: {
            "Authorization": "Bearer $token",
          });

      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! <= 404) {
          return PresensiResponse.fromJson(response.body);
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
