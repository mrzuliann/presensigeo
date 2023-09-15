import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensimob/app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:presensimob/app/data/holidays_provider.dart';

import '../controllers/main_menu_controller.dart';

class MainMenuView extends GetView<MainMenuController> {
  const MainMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: const Text('MainMenuView'),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hallo Selamat Datang 👋👋👋,",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Di Presensi Mobile, anda login sebagai: \nNama : ${SpUtil.getString("name")}\nEmail  : ${SpUtil.getString("email")} \nNIP      : ${SpUtil.getString("nip")} \nSekolah :  ${SpUtil.getString("school_name")}",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => controller.goingToPresensiIn(),
                    child: Container(
                      width: 160,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal,
                            const Color.fromARGB(255, 121, 199, 191),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(5, 5),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              'Presensi Masuk',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => controller.goingToPresensiOut(),
                    child: Container(
                      width: 160,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal,
                            const Color.fromARGB(255, 121, 199, 191),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(5, 5),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              'Presensi Keluar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  " Berita ",
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
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromARGB(255, 0, 175, 157),
                        ),
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ));
                  },
                );
              }).toList(),
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
                SpUtil.clear();
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
                SpUtil.clear();
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
