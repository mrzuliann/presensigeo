import 'package:get/get.dart';

import '../controllers/presensi_out_controller.dart';

class PresensiOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresensiOutController>(
      () => PresensiOutController(),
    );
  }
}
