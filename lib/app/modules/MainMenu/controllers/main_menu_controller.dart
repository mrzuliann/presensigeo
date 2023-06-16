import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensimob/app/routes/app_pages.dart';

class MainMenuController extends GetxController {
  final count = 0.obs;

  RxBool isAbsen = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  goingToPresensiIn() async {
    var result = await Get.toNamed(Routes.PRESENSI_IN);
    if (result != null) {
      Get.snackbar(
        "Sukses",
        "Anda Berhasil Absen",
        backgroundColor: Color.fromARGB(255, 239, 120, 231),
        colorText: Colors.white,
      );
    }
  }
}
