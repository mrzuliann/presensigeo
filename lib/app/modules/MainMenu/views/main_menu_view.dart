import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:presensimob/app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:presensimob/app/data/holidays_provider.dart';

import '../controllers/main_menu_controller.dart';

class MainMenuView extends GetView<MainMenuController> {
  const MainMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan tanggal saat ini
    final now = DateTime.now();

    Widget cardAbsen(
        {required Function()? onTap,
        required String name,
        required String timeWork,
        String? status,
        String? time,
        String? action}) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Colors.teal,
                Color.fromARGB(255, 121, 199, 191),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(5, 5),
                blurRadius: 10,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                timeWork,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                status ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                time ?? '',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                action ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.teal,
      //   elevation: 0,
      //   foregroundColor: Colors.white,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(30),
      //     ),
      //   ),
      //   title: const Text('I.H.S.A.N'),
      //   centerTitle: true,
      // ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(
                    Duration(seconds: 2)); // Simulate a delay for demonstration
              },
              child: Obx(() {
                // final data = controller.loginData.value;

                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return LiquidPullToRefresh(
                  key: controller.refreshIndicatorKey,
                  onRefresh: () async {
                    await controller.getInitData();
                  },
                  showChildOpacityTransition: false,
                  child: ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                      Text(
                        "Selamat Datang 👋👋👋,",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Di Instruksi Harian Siap Ngajar, anda login sebagai: \nNama : ${SpUtil.getString("name")}\nEmail  : ${SpUtil.getString("email")} \nNIP      : ${SpUtil.getString("nip")}, \nLokasi :  ${SpUtil.getString("school_name")}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            cardAbsen(
                              onTap: () => controller.goingToPresensiIn(),
                              name: 'Presensi Masuk',
                              timeWork:
                                  "${controller.timeWorkPh1.value}-${controller.timeWorkLastPh1.value}",
                              status: controller.statusMasuk.value,
                              time: controller.timeMasuk.value != ""
                                  ? controller.timeMasuk.value
                                  : "00:00",
                              action: controller.timeMasuk.value != ""
                                  ? isComeInQuickly(
                                      checkTime: DateTime(
                                        controller.now.year,
                                        controller.now.month,
                                        controller.now.day,
                                        parseTimeString(
                                                controller.timeMasuk.value)
                                            .hour,
                                        parseTimeString(
                                                controller.timeMasuk.value)
                                            .minute,
                                      ),
                                      startHour: parseTimeString(
                                              controller.timeWorkPh1.value)
                                          .hour,
                                      startMinute: parseTimeString(
                                              controller.timeWorkPh1.value)
                                          .minute,
                                      endHour: parseTimeString(
                                              controller.timeWorkLastPh1.value)
                                          .hour,
                                      endMinute: parseTimeString(
                                              controller.timeWorkLastPh1.value)
                                          .minute,
                                    )
                                      ? '(TIDAK HADIR)'
                                      : '(TERLAMBAT)'
                                  : 'BELUM MASUK',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            cardAbsen(
                              onTap: () => controller.goingToPresensiOut(),
                              name: 'Presensi Keluar',
                              timeWork:
                                  "${controller.timeWorkPh2.value}-${controller.timeWorkLastPh2.value}",
                              status: controller.statusKeluar.value,
                              time: controller.timeKeluar.value != ""
                                  ? controller.timeKeluar.value
                                  : "00:00",
                              action: controller.timeKeluar.value != ""
                                  ? isComeInQuickly(
                                      checkTime: DateTime(
                                        controller.now.year,
                                        controller.now.month,
                                        controller.now.day,
                                        parseTimeString(
                                                controller.timeKeluar.value)
                                            .hour,
                                        parseTimeString(
                                                controller.timeKeluar.value)
                                            .minute,
                                      ),
                                      startHour: parseTimeString(
                                              controller.timeWorkPh2.value)
                                          .hour,
                                      startMinute: parseTimeString(
                                              controller.timeWorkPh2.value)
                                          .minute,
                                      endHour: parseTimeString(
                                              controller.timeWorkLastPh2.value)
                                          .hour,
                                      endMinute: parseTimeString(
                                              controller.timeWorkLastPh2.value)
                                          .minute,
                                    )
                                      ? '(TIDAK HADIR)'
                                      : '(TERLAMBAT)'
                                  : 'BELUM MASUK',
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Text(
                            " Galery ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              height: 2,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 180.0,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                        ),
                        items: controller.gallery.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color.fromARGB(255, 0, 175, 157),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    i.image ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 0, 219, 197),
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.add_chart),
              onPressed: () {
                Get.offAllNamed(Routes.LAPORAN_PRESENSI);
              },
            ),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                launch('https://t.me/presensiguru');
              },
              child: Icon(Icons.forum_rounded),
            ),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.security_rounded),
              onPressed: () {
                Get.offAllNamed(Routes.PENGUMUMAN);
              },
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

TimeOfDay parseTimeString(String time) {
  final List<String> parts = time.split(':');
  final int hour = int.parse(parts[0]);
  final int minute = int.parse(parts[1]);

  return TimeOfDay(hour: hour, minute: minute);
}

bool isComeInQuickly({
  required DateTime checkTime,
  required int startHour,
  required int startMinute,
  required int endHour,
  required int endMinute,
}) {
  DateTime endRestrictedTime = DateTime(
    checkTime.year,
    checkTime.month,
    checkTime.day,
    endHour,
    endMinute,
  );

  return checkTime.isBefore(endRestrictedTime);
}
