import 'package:get/get.dart';
import 'package:presensimob/app/models/event_response.dart';
import 'package:presensimob/app/models/gallery_response.dart';
import 'package:presensimob/app/models/get_presensi_response.dart';
import 'package:presensimob/app/models/global_response.dart';
import 'package:sp_util/sp_util.dart';

import '../utils/urls.dart';

class HomeProvider extends GetConnect {
  // Post request
  Future<GetPresensiResponse?> getPresensiResponse() async {
    try {
      var token = SpUtil.getString('token', defValue: '');

      var response = await get("${BaseUrl.baseUrl}get-presensi",
          headers: {"Authorization": "Bearer $token"});

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
      return null;
    }
  }

  Future<GlobalResponse?> getHolidays() async {
    try {
      var token = SpUtil.getString('token', defValue: '');

      var response = await get("${BaseUrl.baseUrl}holidays", headers: {
        "Authorization": "Bearer $token",
      });

      return GlobalResponse.fromJson(response.body);
    } catch (e) {
      return null;
    }
  }

  Future<EventResponse?> getEventList() async {
    try {
      var token = SpUtil.getString('token', defValue: '');

      var response = await get("${BaseUrl.baseUrl}event",
          headers: {"Authorization": "Bearer $token"});

      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! <= 404) {
          return EventResponse.fromJson(response.body);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
