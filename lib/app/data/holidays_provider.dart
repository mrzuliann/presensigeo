import 'package:get/get.dart';

import '../utils/urls.dart';

class HolidaysProvider extends GetConnect {
  Future<Response> getHolidays() {
    var myHeader = {
      'Accept': 'application/json',
    };
    return get('${BaseUrl.baseUrl}holidays', headers: myHeader);
  }
}
