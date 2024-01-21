import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:sp_util/sp_util.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  await initializeDateFormatting('id');

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
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('id', 'ID'),
        ],
        getPages: AppPages.routes,
        locale: const Locale('id_ID'),
        builder: EasyLoading.init(),
      ),
    ),
  );
}
