import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  // Post request
  Future<Response> auth(var data) {
    var myHeader = {
      'Accept': 'application/json',
    };
    // return post('http://36.64.224.194:8998/api/login', data, headers: myHeader);
    return post('https://presensibackend.balangankab.go.id/api/login', data,
        headers: myHeader);
  }
}
