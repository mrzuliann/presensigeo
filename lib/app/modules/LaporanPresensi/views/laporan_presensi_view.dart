import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laporan_presensi_controller.dart';

class LaporanPresensiView extends GetView<LaporanPresensiController> {
  const LaporanPresensiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaporanPresensiView'),
        centerTitle: true,
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
