import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensimob/app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';

import '../controllers/pengumuman_controller.dart';

class PengumumanView extends GetView<PengumumanController> {
  const PengumumanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengumuman'),
        backgroundColor: Colors.teal,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.MAIN_MENU); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Container(
        width: double.infinity, // Mengisi lebar sesuai dengan lebar layar
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // Tindakan yang ingin dilakukan ketika tombol ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                maximumSize: Size(
                    380, double.infinity), // Mengatur lebar maksimum tombol
                padding: const EdgeInsets.all(16),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_sharp, // Ganti dengan logo yang diinginkan
                    color: Colors.white,
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Tentang I.H.S.A.N', // Ganti dengan judul yang diinginkan
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // Tindakan yang ingin dilakukan ketika tombol ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                maximumSize: Size(
                    380, double.infinity), // Mengatur lebar maksimum tombol
                padding: const EdgeInsets.all(16),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons
                        .password_outlined, // Ganti dengan logo yang diinginkan
                    color: Colors.white,
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Ganti Password', // Ganti dengan judul yang diinginkan
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Konfirmasi Logout"),
                      content: Text("Apakah Anda yakin ingin keluar?"),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text("Ya"),
                          onPressed: () {
                            // Tindakan yang diambil jika pengguna menekan tombol "Ya"
                            SpUtil.clear();
                            Get.offAllNamed(Routes.HOME);
                          },
                        ),
                        ElevatedButton(
                          child: Text("Tidak"),
                          onPressed: () {
                            // Tindakan yang diambil jika pengguna menekan tombol "Tidak"
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                maximumSize: Size(380, double.infinity),
                padding: const EdgeInsets.all(16),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded, // Ganti dengan logo yang diinginkan
                    color: Colors.white,
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Logout', // Ganti dengan judul logo yang diinginkan
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
