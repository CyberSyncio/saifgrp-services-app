import 'dart:async';
import 'package:get/get.dart';
import 'package:saif_app/resources/routes/routes_name.dart';

import '../controller/store user session/store_user_data.dart';

class SplashServices extends GetxController {
  final StoreUserData sessionController = Get.put(StoreUserData());
  @override
  void onInit() async {
    isLogin();
    super.onInit();
  }

  void isLogin() {
    Timer(
        const Duration(seconds: 2),
        () => sessionController.isLoggedIn.value
            ? Get.toNamed(RoutesName.dasboardScreen)
            : Get.toNamed(RoutesName.loginScreen));
    update();
  }
}
