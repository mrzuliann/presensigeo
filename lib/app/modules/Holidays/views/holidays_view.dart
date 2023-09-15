import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/holidays_controller.dart';

class HolidaysView extends GetView<HolidaysController> {
  const HolidaysView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HolidaysView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HolidaysView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
