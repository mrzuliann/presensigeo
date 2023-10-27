import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:presensimob/app/data/home_provider.dart';
import 'package:presensimob/app/models/gallery_response.dart';
import 'package:presensimob/app/models/get_presensi_response.dart';
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
  // bool isSafeDevice = false;
  bool isDevelopmentModeEnable = false;
  RxList<DataPresensi> presensi = (List<DataPresensi>.of([])).obs;
  RxList<DataGallery> gallery = (List<DataGallery>.of([])).obs;

  final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  var now = DateTime.now();

  final count = 0.obs;

  RxBool isAbsen = false.obs;
  RxBool isLoading = false.obs;

  RxString timeWorkPh1 = '00:00'.obs;
  RxString timeWorkLastPh1 = '00:00'.obs;

  RxString timeWorkPh2 = '00:00'.obs;
  RxString timeWorkLastPh2 = '00:00'.obs;

  RxString timeMasuk = '00:00'.obs;
  RxString statusMasuk = ''.obs;

  RxString timeKeluar = '00:00'.obs;
  RxString statusKeluar = ''.obs;

  Rx<Data> loginData = Data().obs;

  @override
  void onInit() {
    getInitData();

    super.onInit();
  }

  Future<void> getInitData() async {
    getInfoLogin();
    getGallery();
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
        timeWorkPh1.value = loginData.value.school != null &&
                loginData.value.school!.presensihourday != null &&
                loginData.value.school!.presensihourday!.isNotEmpty
            ? loginData.value.school!.presensihourday!
                    .where((element) =>
                        element.phDay ==
                        DateFormat('EEEE')
                            .format(DateTime.now())
                            .toString()
                            .toLowerCase())
                    .where((element) => element.phId == 1)
                    .toList()
                    .isNotEmpty
                ? loginData.value.school!.presensihourday!
                        .where((element) =>
                            element.phDay ==
                            DateFormat('EEEE')
                                .format(DateTime.now())
                                .toString()
                                .toLowerCase())
                        .where((element) => element.phId == 1)
                        .toList()[0]
                        .phTimeStart ??
                    '00:00'
                : '00:00'
            : '00:00';
        timeWorkLastPh1.value = loginData.value.school != null &&
                loginData.value.school!.presensihourday != null &&
                loginData.value.school!.presensihourday!.isNotEmpty
            ? loginData.value.school!.presensihourday!
                    .where((element) =>
                        element.phDay ==
                        DateFormat('EEEE')
                            .format(DateTime.now())
                            .toString()
                            .toLowerCase())
                    .where((element) => element.phId == 1)
                    .toList()
                    .isNotEmpty
                ? loginData.value.school!.presensihourday!
                        .where((element) =>
                            element.phDay ==
                            DateFormat('EEEE')
                                .format(DateTime.now())
                                .toString()
                                .toLowerCase())
                        .where((element) => element.phId == 1)
                        .toList()[0]
                        .phTimeEnd ??
                    '00:00'
                : '00:00'
            : '00:00';

        timeWorkPh2.value = loginData.value.school != null &&
                loginData.value.school!.presensihourday != null &&
                loginData.value.school!.presensihourday!.isNotEmpty
            ? loginData.value.school!.presensihourday!
                    .where((element) =>
                        element.phDay ==
                        DateFormat('EEEE')
                            .format(DateTime.now())
                            .toString()
                            .toLowerCase())
                    .where((element) => element.phId == 2)
                    .toList()
                    .isNotEmpty
                ? loginData.value.school!.presensihourday!
                        .where((element) =>
                            element.phDay ==
                            DateFormat('EEEE')
                                .format(DateTime.now())
                                .toString()
                                .toLowerCase())
                        .where((element) => element.phId == 2)
                        .toList()[0]
                        .phTimeStart ??
                    '00:00'
                : '00:00'
            : '00:00';
        timeWorkLastPh2.value = loginData.value.school != null &&
                loginData.value.school!.presensihourday != null &&
                loginData.value.school!.presensihourday!.isNotEmpty
            ? loginData.value.school!.presensihourday!
                    .where((element) =>
                        element.phDay ==
                        DateFormat('EEEE')
                            .format(DateTime.now())
                            .toString()
                            .toLowerCase())
                    .where((element) => element.phId == 2)
                    .toList()
                    .isNotEmpty
                ? loginData.value.school!.presensihourday!
                        .where((element) =>
                            element.phDay ==
                            DateFormat('EEEE')
                                .format(DateTime.now())
                                .toString()
                                .toLowerCase())
                        .where((element) => element.phId == 2)
                        .toList()[0]
                        .phTimeEnd ??
                    '00:00'
                : '00:00'
            : '00:00';
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
        var objMasuk = dataMasuk.isNotEmpty ? dataMasuk[0] : DataPresensi();
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
        var dataKeluar = presensi.where((e) => e.phId == 2).toList();
        var objKeluar = dataKeluar.isNotEmpty ? dataKeluar[0] : DataPresensi();
        timeKeluar.value = objKeluar.masuk ?? '';
        statusKeluar.value = objKeluar.psId == 2
            ? 'HADIR'
            : objKeluar.psId == 2
                ? 'TIDAK HADIR'
                : objKeluar.psId == 3
                    ? 'IZIN'
                    : objKeluar.psId == 4
                        ? 'SAKIT'
                        : objKeluar.psId == 5
                            ? 'CUTI'
                            : objKeluar.psId == 6
                                ? 'TUGAS'
                                : objKeluar.psId == 7
                                    ? 'IZIN TERLAMBAT'
                                    : objKeluar.psId == 8
                                        ? 'IZIN PULANG CEPAT'
                                        : '';

        print('prensi length ${presensi.length}');
      }
    } finally {}
  }

  Future<void> getGallery() async {
    try {
      var response = await HomeProvider().getGallery();

      if (response?.data?.isNotEmpty ?? false) {
        gallery.value = response?.data ?? [];
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
    var result = await Get.toNamed(Routes.PRESENSI_OUT, arguments: {
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
