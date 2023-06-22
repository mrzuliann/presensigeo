import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presensimob/app/routes/app_pages.dart';

import '../controllers/pengumuman_controller.dart';

class PengumumanView extends GetView<PengumumanController> {
  const PengumumanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PengumumanView'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.MAIN_MENU);
          },
        ),
      ),
      body: const Center(
        child: Text(
          'PengumumanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
