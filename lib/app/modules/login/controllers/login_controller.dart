import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:presensimob/app/data/login_provider.dart';
import 'package:presensimob/app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';

class LoginController extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  void auth() {
    // cek debug email
    // print(txtEmail.text);
    String email = txtEmail.text;
    String password = txtPassword.text;
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Email dan Password tidak boleh kosong!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      EasyLoading.show();
      var data = {
        "email": email,
        "password": password,
      };
      LoginProvider().auth(data).then((value) async {
        if (value.statusCode == 200) {
          await Geolocator.requestPermission();
          // check debug value if 200
          var responseBody = value.body;
          var data = responseBody['data'];
          // var name = data['name'];
          // var token = data['token'];
          // print(data);
          SpUtil.putString('name', data['name']);
          // SpUtil.putInt('nip', data['nip']);
          // SpUtil.putInt('school_id', data['school_id']);
          SpUtil.putString('nip', data['nip'].toString());
          SpUtil.putString('token', data['token']);
          SpUtil.putString('email', data['email']);
          SpUtil.putString('id', data['id'].toString());
          SpUtil.putBool('isLogin', true);
          //menuju routes: main menu
          Get.offAllNamed(Routes.MAIN_MENU);

          Get.snackbar(
            "Success",
            "Login Berhasil",
            backgroundColor: Color.fromARGB(255, 239, 120, 231),
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Error",
            "Login Gagal",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
        EasyLoading.dismiss();
      });
      // Get.snackbar(
      //   "Success",
      //   "Login Berhasil",
      //   backgroundColor: Color.fromARGB(255, 19, 211, 157),
      //   colorText: Colors.white,
      // );
    }
  }
}
