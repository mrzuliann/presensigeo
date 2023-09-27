import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensimob/app/routes/app_pages.dart';

class LaporanPresensiView extends StatelessWidget {
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
            Get.offAllNamed(Routes.MAIN_MENU);
          },
        ),
      ),
      body: Center(
        child: TealButtonGrid(),
      ),
    );
  }
}

class TealButtonGrid extends StatelessWidget {
  const TealButtonGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1, // Set the aspect ratio to make squares
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Add your button's onPressed logic here
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Button ${index + 1}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}
