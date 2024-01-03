import 'package:get/get.dart';
import 'package:presensimob/app/models/gallery_response.dart';
import 'package:presensimob/app/models/get_presensi_response.dart';
import 'package:sp_util/sp_util.dart';

import '../utils/urls.dart';

class HomeProvider extends GetConnect {
  // Post request
  Future<GetPresensiResponse?> getPresensiResponse() async {
    try {
      var token = SpUtil.getString('token', defValue: '');

      var response = await get("${BaseUrl.baseUrl}get-presensi", headers: {
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

  Future<GalleryResponse?> getGallery() async {
    try {
      var token = SpUtil.getString('token', defValue: '');

      var response = await get("${BaseUrl.baseUrl}galery", headers: {
        "Authorization": "Bearer $token",
      });

      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! <= 404) {
          return GalleryResponse.fromJson(response.body);
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
