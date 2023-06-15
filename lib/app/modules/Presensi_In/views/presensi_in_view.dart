import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presensimob/app/routes/app_pages.dart';

import '../controllers/presensi_in_controller.dart';

class PresensiInView extends GetView<PresensiInController> {
  const PresensiInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi Masuk'),
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
          'Presensi Masuk is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
