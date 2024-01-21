import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:presensimob/app/data/laporan_provider.dart';
import 'package:presensimob/app/models/laporan_response.dart';
// import 'package:month_year_picker/month_year_picker.dart';

class LaporanPresensiController extends GetxController {
  RxList<DataLaporan> laporans = (List<DataLaporan>.of([])).obs;
  RxBool isLoading = false.obs;

  Rx<DateTime> now = DateTime.now().obs;

  @override
  void onInit() {
    getLaporan();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getLaporan() async {
    try {
      print('ini month ${now.value.month}');
      isLoading(true);
      var response = await LaporanProvider().getLaporanPreensi();

      if (response?.success == true) {
        laporans.value = response?.data
                ?.where((element) =>
                    element.bulan == now.value.month &&
                    element.tahun == now.value.year)
                .toList() ??
            [];
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> datePickerMonth() async {
    // final DateTime? picked = await showMonthYearPicker(
    //   context: Get.context!,
    //   locale: Locale('id'),
    //   initialDate: now.value,
    //   firstDate: DateTime(1995),
    //   lastDate: DateTime.now(),
    // );

    // if (picked != null && picked != now.value) {
    //   now.value = picked;
    //   getLaporan();
    // }

    showMonthPicker(
      context: Get.context!,
      firstDate: DateTime(1995),
      lastDate: DateTime.now(),
      initialDate: now.value,
      locale: const Locale('id'),
      //show only even months
      headerColor: Colors.amber[900],
      headerTextColor: Colors.black,
      selectedMonthBackgroundColor: Colors.amber[900],
      selectedMonthTextColor: Colors.white,
      unselectedMonthTextColor: Colors.green,
      confirmWidget: Text(
        'Ok',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.amber[900],
        ),
      ),
      cancelWidget: Text(
        'Batal',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.amber[900],
        ),
      ),
      roundedCornersRadius: 20,
      yearFirst: false,
      backgroundColor: Colors.yellow[100],
    ).then((DateTime? date) async {
      if (date != null) {
        now.value = date;
        getLaporan();
      }
    });
  }
}
