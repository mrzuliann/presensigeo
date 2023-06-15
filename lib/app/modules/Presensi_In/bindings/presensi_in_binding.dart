import 'package:get/get.dart';

import '../controllers/presensi_in_controller.dart';

class PresensiInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresensiInController>(
      () => PresensiInController(),
    );
  }
}
