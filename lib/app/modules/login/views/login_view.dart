import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 0,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Row(
            children: [
              Image.asset(
                "images/balangan.png",
                width: 70,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hallo Selamat Datang,",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Di presensi Disdik Mobile, Silahkan Login disini!",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: controller.txtEmail,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.txtPassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => controller.auth(),
                child: Text(
                  "L O G I N",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    fixedSize: Size(Get.width, 30)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    " Copyright© By: ",
                    style: TextStyle(color: Colors.black),
                  ),
                  Expanded(
                    child: Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/balangan.png",
                          width: 80,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "images/disdik.png",
                          width: 60,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        // Image.asset(
                        //   "images/balangan.png",
                        //   width: 80,
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      " Version 1.0.0 ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
