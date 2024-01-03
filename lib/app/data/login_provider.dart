import 'package:get/get.dart';
import 'package:presensimob/app/models/login_request.dart';
import 'package:presensimob/app/models/login_response.dart';

import '../utils/urls.dart';

class LoginProvider extends GetConnect {
  // Post request
  Future<Response> auth(var data) {
    var myHeader = {
      'Accept': 'application/json',
    };
    return post('${BaseUrl.baseUrl}login', data, headers: myHeader);
    // return post('https://presensibackend.balangankab.go.id/api/login', data,
    //     headers: myHeader);
  }

  Future<LoginResponse?> newAuth({required LoginRequest request}) async {
    try {
      var response =
          await post("${BaseUrl.baseUrl}login", request.toMap(), headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! <= 404) {
          return LoginResponse.fromJson(response.body);
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
