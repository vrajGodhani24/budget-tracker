import 'dart:async';

import 'package:expence_tracker/module/helper/database_helper.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    DBHelper.dbHelper.initDB();
    Timer(
      const Duration(seconds: 2),
      () => Get.offAllNamed('/'),
    );
  }
}
