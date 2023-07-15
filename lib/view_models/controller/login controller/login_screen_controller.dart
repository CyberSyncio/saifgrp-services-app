import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saif_app/repository/login_repository/login_repo.dart';
import 'package:saif_app/resources/routes/routes_name.dart';
import 'package:saif_app/utils/utils.dart';

import '../building_controller/building_controller.dart';
import '../store user session/store_user_data.dart';

class LoginController extends GetxController {
//>>>>>>>>>>>>>>>>>>>>>> EDITING CONTROLLER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  StoreUserData userData = StoreUserData();
  //>>>>>>>>>>>>>>>>>>>>>> POST API CALL OF REPO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  final BuildingController _building = Get.put(BuildingController());

  final _api = LoginRepository();
  @override
  void onInit() async {
    await _building.getBuilding();
    super.onInit();
  }

  loginApi() {
    loading.value = true;
    update();
    var data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };
    _api.loginApi(data).then((value) async {
      Utils.snackBar("Login", "Login Successful");
      await userData.login(value['key']);
      Get.toNamed(RoutesName.dasboardScreen);
      emailController.value.clear();
      passwordController.value.clear();
      loading.value = false;
      update();
    }).onError((error, stackTrace) {
      passwordController.value.clear();
      Utils.snackBar("Login ", "Please Enter A valid Email Or Password");
      loading.value = false;
      update();
    });
  }
}
