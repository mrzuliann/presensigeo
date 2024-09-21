import 'package:fl_chart/fl_chart.dart';
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
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () => controller.datePickerMonth(),
                  child: Text(
                    DateFormat('MMMM yyyy', 'id').format(controller.now.value),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        backgroundColor: Colors.black38),
                  ),
                ),
              ),
              GridView.count(
                physics:
                    const NeverScrollableScrollPhysics(), // Prevents internal grid scroll
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
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
                    name: 'Izin',
                    count: controller.laporans.isNotEmpty
                        ? controller.laporans.first.izin.toString()
                        : '0',
                  ),
                  CardLaporanItem(
                    name: 'Sakit',
                    count: controller.laporans.isNotEmpty
                        ? controller.laporans.first.sakit.toString()
                        : '0',
                  ),
                  CardLaporanItem(
                      name: 'Cuti',
                      count: controller.laporans.isNotEmpty
                          ? controller.laporans.first.cuti.toString()
                          : '0'),
                  CardLaporanItem(
                      name: 'Tugas',
                      count: controller.laporans.isNotEmpty
                          ? controller.laporans.first.tugas.toString()
                          : '0'),
                  CardLaporanItem(
                      name: 'Izin Terlambat',
                      count: controller.laporans.isNotEmpty
                          ? controller.laporans.first.izinTerlambat.toString()
                          : '0'),
                  CardLaporanItem(
                      name: 'Acara',
                      count: controller.laporans.isNotEmpty
                          ? controller.laporans.first.izinTerlambat.toString()
                          : '0'),
                  CardLaporanItem(
                      name: 'Izin Pulang Cepat',
                      count: controller.laporans.isNotEmpty
                          ? controller.laporans.first.izinPulangCepat.toString()
                          : '0'),
                ],
              ),
              SizedBox(
                height: 280,
                child: PieChartCustom(),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class PieChartCustom extends StatefulWidget {
  const PieChartCustom({super.key});

  @override
  State<PieChartCustom> createState() => _PieChartCustomState();
}

class _PieChartCustomState extends State<PieChartCustom> {
  final controller = Get.find<LaporanPresensiController>();
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: showingSections(controller),
        borderData: FlBorderData(show: false),
        sectionsSpace: 0,
        centerSpaceRadius: 40,
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex =
                  pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      LaporanPresensiController controller) {
    return List.generate(9, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: controller.laporans.isNotEmpty
                ? controller.laporans.first.hadir?.toDouble()
                : 0,
            title: 'Hadir',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: controller.laporans.isNotEmpty
                ? controller.laporans.first.tidakHadir?.toDouble()
                : 0,
            title: 'Tidak Hadir',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.orange,
            value: controller.laporans.isNotEmpty
                ? controller.laporans.first.izin?.toDouble()
                : 0,
            title: 'Izin',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.yellow,
            value: controller.laporans.isNotEmpty
                ? controller.laporans.first.sakit?.toDouble()
                : 0,
            title: 'Sakit',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 4:
          return PieChartSectionData(
            color: Colors.blue,
            value: controller.laporans.isNotEmpty
                ? controller.laporans.first.cuti?.toDouble()
                : 0,
            title:
                '${controller.laporans.isNotEmpty ? controller.laporans.first.cuti : 0}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 5:
          return PieChartSectionData(
            color: Colors.purple,
            value: controller.laporans.isNotEmpty
                ? controller.laporans.first.tugas?.toDouble()
                : 0,
            title: 'Tugas',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 6:
          return PieChartSectionData(
            color: Colors.teal,
            value: controller.laporans.isNotEmpty
                ? controller.laporans.first.izinTerlambat?.toDouble()
                : 0,
            title: 'Izin Terlambat',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 7:
          return PieChartSectionData(
            color: Colors.pink,
            value: controller.laporans.isNotEmpty
                ? controller.laporans.first.izinTerlambat?.toDouble()
                : 0,
            title: 'Acara',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 8:
          return PieChartSectionData(
            color: Colors.brown,
            value: controller.laporans.isNotEmpty
                ? controller.laporans.first.izinPulangCepat?.toDouble()
                : 0,
            title: 'Izin Pulang Cepat',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
