import 'package:get/get.dart';

import '../controllers/laporan_presensi_controller.dart';

class LaporanPresensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPresensiController>(
      () => LaporanPresensiController(),
    );
  }
}
