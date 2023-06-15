import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengumuman_controller.dart';

class PengumumanView extends GetView<PengumumanController> {
  const PengumumanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PengumumanView'),
        centerTitle: true,
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
