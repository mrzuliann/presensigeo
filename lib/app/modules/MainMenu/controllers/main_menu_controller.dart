import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_device/safe_device.dart';
import 'package:sp_util/sp_util.dart';
import 'package:presensimob/app/routes/app_pages.dart';

class MainMenuController extends GetxController {
  @override
  bool isJailBroken = false;
  bool canMockLocation = false;
  bool isRealDevice = true;
  bool isOnExternalStorage = false;
  bool isSafeDevice = false;
  bool isDevelopmentModeEnable = false;

  final count = 0.obs;

  RxBool isAbsen = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkDeviceSafety();
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

  goingToPresensiOut() async {
    var result = await Get.toNamed(Routes.PRESENSI_OUT);
    if (result != null) {
      Get.snackbar(
        "Sukses",
        "Anda Berhasil Absen",
        backgroundColor: Color.fromARGB(255, 239, 120, 231),
        colorText: Colors.white,
      );
    }
  }

  Future<void> checkDeviceSafety() async {
    bool isJailbroken = await SafeDevice.isJailBroken;
    bool isRooted = await SafeDevice.isSafeDevice;
    bool isMockLocation = await SafeDevice.canMockLocation;
    bool isDevelopmentModeEnable = await SafeDevice.isDevelopmentModeEnable;

    if (isRooted || isDevelopmentModeEnable || isMockLocation) {
      Get.dialog(
        AlertDialog(
          title: Text('Peringatan'),
          content: Text(
            'Perangkat Anda telah dijailbreak, di-root, atau menggunakan lokasi palsu. Aplikasi ini tidak dapat berjalan pada perangkat yang tidak aman.',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Tindakan yang diambil jika pengguna menekan tombol "Ya"
                SpUtil.clear();
                Get.offAllNamed(Routes.HOME);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Lakukan tindakan jika perangkat aman
      // Contoh: Melanjutkan ke halaman berikutnya
      Get.toNamed(Routes.PRESENSI_IN);
    }
  }
}
