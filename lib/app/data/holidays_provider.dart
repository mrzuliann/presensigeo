import 'package:get/get.dart';

class HolidaysProvider extends GetConnect {
  Future<Response> getHolidays() {
    var myHeader = {
      'Accept': 'application/json',
    };
    return get('http://36.64.224.194:8999/api/holidays', headers: myHeader);
  }
}
