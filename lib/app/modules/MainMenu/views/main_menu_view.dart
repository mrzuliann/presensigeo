import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presensimob/app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../controllers/main_menu_controller.dart';

class MainMenuView extends GetView<MainMenuController> {
  const MainMenuView({Key? key}) : super(key: key);

  // nambah menu nav bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 56, 62, 236),
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
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Di Presensi Mobile, anda login sebagai: \nNama : ${SpUtil.getString("name")}\nEmail  : ${SpUtil.getString("email")} \nNIP      : ${SpUtil.getString("nip")} \nSekolah: ${SpUtil.getInt("school_id")}",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
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
                  ElevatedButton(
                    onPressed: () => controller.goingToPresensiIn(),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 80),
                        backgroundColor: Color.fromARGB(255, 249, 111, 111)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fingerprint_rounded,
                            color: Colors.black), // Ikon presensi masuk
                        SizedBox(height: 5), // Jarak antara ikon dan teks
                        Text(
                          "Presensi Masuk",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(
                          Routes.PRESENSI_OUT); // Kembali ke halaman sebelumnya
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 80),
                        backgroundColor: Colors.amberAccent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fingerprint_sharp,
                            color: Colors.black), // Ikon presensi masuk
                        SizedBox(height: 5), // Jarak antara ikon dan teks
                        Text(
                          "Presensi Pulang",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
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
                // Expanded(
                //   child: Divider(
                //     height: 2,
                //     color: Colors.black,
                //   ),
                // ),
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
              options: CarouselOptions(height: 180.0),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color.fromARGB(255, 66, 63, 254)),
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ));
                  },
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                SpUtil.clear();
                Get.offAllNamed(Routes.HOME);
              },
              child: Text(
                "Logout",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.add_chart_rounded),
              onPressed: () {
                SpUtil.clear();
                Get.offAllNamed(Routes.HOME);
              },
            ),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.forum_rounded),
              onPressed: () {
                SpUtil.clear();
                Get.offAllNamed(Routes.PRESENSI_IN);
              },
            ),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
