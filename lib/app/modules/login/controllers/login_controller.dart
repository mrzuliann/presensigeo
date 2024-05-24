import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:presensimob/app/data/login_provider.dart';
import 'package:presensimob/app/models/login_request.dart';
import 'package:presensimob/app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginController extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  void auth() async {
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
      // var data = {
      //   "email": email,
      //   "password": password,
      // };
      // LoginProvider().auth(data).then((value) async {
      //   if (value.statusCode == 200) {
      //     await Geolocator.requestPermission();
      //     // check debug value if 200
      //     var responseBody = value.body;
      //     var data = responseBody['data'];
      //     // var name = data['name'];
      //     // var token = data['token'];
      //     // print(data);
      //     SpUtil.putString('name', data['name']);
      //     // SpUtil.putInt('nip', data['nip']);
      //     // SpUtil.putInt('school_id', data['school_id']);
      //     SpUtil.putString('nip', data['nip'].toString());
      //     // SpUtil.putInt('school_id', data['school_id']);
      //     SpUtil.putString('token', data['token']);
      //     SpUtil.putString('email', data['email']);
      //     SpUtil.putString('id', data['id'].toString());
      //     SpUtil.putString('school_name', data['school']['name']);
      //     // SpUtil.putString('school_latitude', data['school']['latitude']);
      //     // SpUtil.putString('school_longitude', data['school']['longitude']);
      //     // SpUtil.putDouble('radius', double.parse(data['school']['radius']));
      //     SpUtil.putBool('isLogin', true);
      //     //menuju routes: main menu
      //     Get.offAllNamed(Routes.MAIN_MENU);

      //     Get.snackbar(
      //       "Success",
      //       "Login Berhasil ",
      //       backgroundColor: Color.fromARGB(255, 239, 120, 231),
      //       colorText: Colors.white,
      //     );
      //   } else {
      //     Get.snackbar(
      //       "Error",
      //       "Login Gagal",
      //       backgroundColor: Colors.red,
      //       colorText: Colors.white,
      //     );
      //   }
      //   EasyLoading.dismiss();
      // });
      try {
        EasyLoading.show();
        var request = LoginRequest(email: email, password: password);
        var response = await LoginProvider().newAuth(request: request);

        if (response?.success == true) {
          // await Geolocator.requestPermission();
          SpUtil.putString('name', response?.data?.name ?? '');
          SpUtil.putString('nip', response?.data?.nip ?? '');
          SpUtil.putString('avatar', response?.data?.avatar ?? '');
          // SpUtil.putInt('school_id', data['school_id']);
          SpUtil.putString('email', response?.data?.email ?? '');
          SpUtil.putString('id', response?.data?.id.toString() ?? '');
          SpUtil.putString('token', response?.data?.token ?? '');
          SpUtil.putString('email', response?.data?.email ?? '');
          SpUtil.putString('password', password);

          SpUtil.putString('school_name', response?.data?.school?.name ?? '');
          SpUtil.putString('school_latitude',
              '${response?.data?.school?.latitude ?? '0.0'}');
          SpUtil.putString('school_longitude',
              '${response?.data?.school?.longitude ?? ' 0.0'}');
          SpUtil.putDouble('radius',
              double.parse('${response?.data?.school?.radius ?? '0'}'));
          SpUtil.putBool('isLogin', true);

          if (await Permission.location.isGranted) {
          } else {
            Permission.location.request();
          }

          Get.offAllNamed(Routes.MAIN_MENU);
          Get.snackbar(
            "Success",
            "Login Berhasil ",
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
      } finally {
        EasyLoading.dismiss();
      }
      // Get.snackbar(
      //   "Success",
      //   "Login Berhasil",
      //   backgroundColor: Color.fromARGB(255, 19, 211, 157),
      //   colorText: Colors.white,
      // );
    }
  }
}
