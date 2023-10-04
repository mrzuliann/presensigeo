import 'package:get/get.dart';
import 'package:presensimob/app/data/laporan_provider.dart';
import 'package:presensimob/app/models/laporan_response.dart';

class LaporanPresensiController extends GetxController {
  RxList<DataLaporan> laporans = (List<DataLaporan>.of([])).obs;
  RxBool isLoading = false.obs;

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
      isLoading(true);
      var response = await LaporanProvider().getLaporanPreensi();

      if (response?.success == true) {
        laporans.value = response?.data ?? [];
      }
    } finally {
      isLoading(false);
    }
  }
}
