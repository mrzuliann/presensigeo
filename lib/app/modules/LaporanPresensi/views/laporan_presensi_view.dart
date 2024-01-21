import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presensimob/app/components/card_laporan_item.dart';
import 'package:presensimob/app/modules/LaporanPresensi/controllers/laporan_presensi_controller.dart';
import 'package:presensimob/app/routes/app_pages.dart';

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
        }

        //  else if (controller.laporans.isNotEmpty) {
        //   return GridView.builder(
        //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        //     gridDelegate:
        //         SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        //       crossAxisCount: 3,
        //       height: 180, // Set the aspect ratio to make squares
        //       mainAxisSpacing: 8,
        //       crossAxisSpacing: 8,
        //     ),
        //     itemCount: 7,
        //     itemBuilder: (context, index) {
        //       return CardLaporanItem(name: 'Hadir', count: '10');
        //     },
        //   );
        // }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () => controller.datePickerMonth(),
                child: Text(
                  DateFormat('MMMM yyyy', 'id').format(
                    controller.now.value,
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                crossAxisCount: 3,
                childAspectRatio: 1.1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  CardLaporanItem(
                    name: 'Hadir',
                    count: controller.laporans.isNotEmpty
                        ? controller.laporans.first.hadir.toString()
                        : '0',
                  ),
                  CardLaporanItem(
                    name: 'Tidak Hadir',
                    count: controller.laporans.isNotEmpty
                        ? controller.laporans.first.tidakHadir.toString()
                        : '0',
                  ),
                  CardLaporanItem(
                    name: 'izin',
                    count: controller.laporans.isNotEmpty
                        ? controller.laporans.first.izin.toString()
                        : '0',
                  ),
                  CardLaporanItem(
                    name: 'sakit',
                    count: controller.laporans.isNotEmpty
                        ? controller.laporans.first.sakit.toString()
                        : '0',
                  ),
                  CardLaporanItem(
                      name: 'cuti',
                      count: controller.laporans.isNotEmpty
                          ? controller.laporans.first.cuti.toString()
                          : '0'),
                  CardLaporanItem(
                      name: 'tugas',
                      count: controller.laporans.isNotEmpty
                          ? controller.laporans.first.tugas.toString()
                          : '0'),
                  CardLaporanItem(
                      name: 'Izin terlambat',
                      count: controller.laporans.isNotEmpty
                          ? controller.laporans.first.izinTerlambat.toString()
                          : '0'),
                  CardLaporanItem(
                      name: 'Izin pulang cepat',
                      count: controller.laporans.isNotEmpty
                          ? controller.laporans.first.izinPulangCepat.toString()
                          : '0'),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
