import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import 'package:sp_util/sp_util.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(
    AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.teal,
        statusBarBrightness: Brightness.light,
      ),
      child: GetMaterialApp(
        title: "Application",
        initialRoute: (SpUtil.getBool('isLogin', defValue: false)!
            ? Routes.MAIN_MENU
            : Routes.HOME),
        getPages: AppPages.routes,
        builder: EasyLoading.init(),
      ),
    ),
  );
}
