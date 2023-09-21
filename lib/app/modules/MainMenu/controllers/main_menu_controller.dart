import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensimob/app/data/home_provider.dart';
import 'package:presensimob/app/models/get_presensi_response.dart';
import 'package:safe_device/safe_device.dart';
import 'package:sp_util/sp_util.dart';
import 'package:presensimob/app/routes/app_pages.dart';

import '../../../data/login_provider.dart';
import '../../../models/login_request.dart';
import '../../../models/login_response.dart';

class MainMenuController extends GetxController {
  bool isJailBroken = false;
  bool canMockLocation = false;
  bool isRealDevice = true;
  bool isOnExternalStorage = false;
  bool isSafeDevice = false;
  bool isDevelopmentModeEnable = false;
  RxList<DataPresensi> presensi = (List<DataPresensi>.of([])).obs;

  var now = DateTime.now();

  final count = 0.obs;

  RxBool isAbsen = false.obs;
  RxBool isLoading = false.obs;

  RxString timeMasuk = ''.obs;
  RxString statusMasuk = ''.obs;

  Rx<Data> loginData = Data().obs;

  @override
  void onInit() {
    super.onInit();
    checkDeviceSafety();
  }

  Future<void> getInfoLogin() async {
    try {
      isLoading(true);
      var request = LoginRequest(
          email: SpUtil.getString('email'),
          password: SpUtil.getString('password'));
      var response = await LoginProvider().newAuth(request: request);

      if (response?.success == true) {
        loginData.value = response?.data ?? Data();
        getPresensi();
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> getPresensi() async {
    try {
      var response = await HomeProvider().getPresensiResponse();

      if (response?.success == true) {
        presensi.value = response?.data
                ?.where((element) => element.isHariIni == true)
                .toList() ??
            [];

        var dataMasuk = presensi.where((e) => e.phId == 1).toList();
        var objMasuk = dataMasuk[0];
        timeMasuk.value = objMasuk.masuk ?? '';
        statusMasuk.value = objMasuk.psId == 1
            ? 'HADIR'
            : objMasuk.psId == 2
                ? 'TIDAK HADIR'
                : objMasuk.psId == 3
                    ? 'IZIN'
                    : objMasuk.psId == 4
                        ? 'SAKIT'
                        : objMasuk.psId == 5
                            ? 'CUTI'
                            : objMasuk.psId == 6
                                ? 'TUGAS'
                                : objMasuk.psId == 7
                                    ? 'IZIN TERLAMBAT'
                                    : objMasuk.psId == 8
                                        ? 'IZIN PULANG CEPAT'
                                        : '';
        print('prensi length ${presensi.length}');
      }
    } finally {}
  }

  goingToPresensiIn() async {
    var result = await Get.toNamed(Routes.PRESENSI_IN, arguments: {
      'latitude': loginData.value.school?.latitude ?? '',
      'longitude': loginData.value.school?.longitude ?? '',
      'radius': loginData.value.school?.radius ?? '',
    });
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
      // Get.toNamed(Routes.PRESENSI_IN);
      getInfoLogin();
    }
  }
}

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == this.day &&
        now.month == this.month &&
        now.year == this.year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return yesterday.day == this.day &&
        yesterday.month == this.month &&
        yesterday.year == this.year;
  }
}
