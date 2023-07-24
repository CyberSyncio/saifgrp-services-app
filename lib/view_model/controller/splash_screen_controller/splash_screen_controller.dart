import 'dart:async';
import 'package:get/get.dart';
import '../../../utils/routes/routes_name.dart';
import '../user_session_controller/store_user_data.dart';

class SplashScreenController extends GetxController {
  final StoreUserData sessionController = Get.put(StoreUserData());

  @override
  void onInit() {
    isLogin();
    super.onInit();
  }

  void isLogin() {
    Timer(
        const Duration(seconds: 2),
        () => sessionController.isLoggedIn.value
            ? Get.offAllNamed(RoutesName.homeMainScreen)
            : Get.offAllNamed(RoutesName.welcomeScreen));
    update();
  }
}
