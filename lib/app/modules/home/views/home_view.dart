// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 255, 251, 1),
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60))),
        leading: Container(
          padding: EdgeInsets.only(
            left: 3,
            top: 3,
            bottom: 3,
          ),
          child: Image.asset("images/balangan.png"),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 173, 156),
        title: Text(
          'HomeView',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Image.asset("images/user.png"),
            Text(
              "Presensi Mobile",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Presensi Kehadiran \nBerbasis Mobile with Geolocation dan Praktis",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => controller.onTapLogin(),
              child: Text(
                "L O G I N",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, fixedSize: Size(Get.width, 30)),
            ),
            SizedBox(height: 10),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text(
            //     "R E G I S T E R",
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.white,
            //       fixedSize: Size(Get.width - 100, 40)),
            // ),
          ],
        ),
      ),
    );
  }
}
