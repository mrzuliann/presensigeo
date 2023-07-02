import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presensimob/app/routes/app_pages.dart';

import '../controllers/laporan_presensi_controller.dart';

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
            Get.offAllNamed(Routes.MAIN_MENU); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: const Center(
        child: Text(
          'LaporanPresensiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
