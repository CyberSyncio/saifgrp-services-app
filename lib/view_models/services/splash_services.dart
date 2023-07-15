import 'dart:async';
import 'package:get/get.dart';
import 'package:saif_app/resources/routes/routes_name.dart';
import '../controller/building_controller/building_controller.dart';
import '../controller/store user session/store_user_data.dart';

class SplashServices extends GetxController {
  final StoreUserData sessionController = Get.put(StoreUserData());
  final BuildingController _building = Get.put(BuildingController());

  @override
  void onInit() async {
    await _building.getBuilding();

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
