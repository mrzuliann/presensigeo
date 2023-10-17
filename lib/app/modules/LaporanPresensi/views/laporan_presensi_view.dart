import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensimob/app/modules/LaporanPresensi/controllers/laporan_presensi_controller.dart';
import 'package:presensimob/app/routes/app_pages.dart';

import '../../../components/sliver_grid_rasio_custom.dart';

class LaporanPresensiView extends GetView<LaporanPresensiController> {
  const LaporanPresensiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Presensi'),
        backgroundColor: Colors.teal,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.MAIN_MENU);
          },
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.laporans.isNotEmpty) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 3,
              height: 180, // Set the aspect ratio to make squares
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: controller.laporans.length,
            itemBuilder: (context, index) {
              final obj = controller.laporans[index];

              return ElevatedButton(
                onPressed: () {
                  // Add your button's onPressed logic here
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Bulan ${obj.bulan}/${obj.tahun}',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Hadir: ${obj.hadir}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Izin: ${obj.izin}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Sakit: ${obj.sakit}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Cuti: ${obj.cuti}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Tugas: ${obj.tugas}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Izin Terlambat: ${obj.izinTerlambat}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Izin Pulang Cepat: ${obj.izinPulangCepat}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        return Center(child: Text('Data empty'));
      }),
    );
  }
}
