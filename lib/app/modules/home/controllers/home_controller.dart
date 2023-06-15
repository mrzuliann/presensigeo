import 'package:get/get.dart';
import 'package:presensimob/app/routes/app_pages.dart';

class HomeController extends GetxController {
  void onTapLogin() {
    Get.toNamed(Routes.LOGIN);
  }
}
