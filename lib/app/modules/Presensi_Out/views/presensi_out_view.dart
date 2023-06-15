import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presensimob/app/routes/app_pages.dart';

import '../controllers/presensi_out_controller.dart';

class PresensiOutView extends GetView<PresensiOutController> {
  const PresensiOutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi Keluar'),
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
          'Presensi Keluar is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
