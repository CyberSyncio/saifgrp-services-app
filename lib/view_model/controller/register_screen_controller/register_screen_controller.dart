import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/routes/routes_name.dart';

import '../../../repository/register_repository/register_repository.dart';
import '../../../utils/utils.dart';
import '../auth_controller/auth_controller.dart';
import '../building_controller/building_controller.dart';
import '../user_session_controller/store_user_data.dart';

class RegisterController extends GetxController {
//>>>>>>>>>>>>>>>>>>>>>> EDITING CONTROLLER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  final userNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final confirmPasswordController = TextEditingController().obs;
  final confirmPasswordFocusNode = FocusNode().obs;
  final loading = false.obs;
  final dropDownValue = 'Select Your Residential'.obs;
  var buildingId = ''.obs;
  List buildingDetails = [].obs;
  List<String> buildingList = [];
  final StoreUserData _userDataController = StoreUserData();
  final AuthMainScreenController _mainScreenController =
      AuthMainScreenController();
  //>>>>>>>>>>>>>>>>>>>>>> POST API CALL OF REPO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  final _api = RegisterRepository();
  final BuildingController _building = Get.put(BuildingController());
  @override
  void onInit() {
    getBuildingDetails();
    if (buildingList.length == 1) {
      getBuildingDetails();
    }
    super.onInit();
  }

  getBuildingDetails() {
    for (var i = 0; i < _building.buildingModel.length; i++) {
      buildingDetails.add({
        'id': _building.buildingModel[i]['id'],
        'name': _building.buildingModel[i]['name']
      });
    }
    buildingList.add(dropDownValue.value);
    for (var i = 1; i < _building.buildingModel.length; i++) {
      buildingList.add(_building.buildingModel[i]['name']);
    }

    update();
  }

  getBuildingId() async {
    for (int i = 0; i < buildingDetails.length; i++) {
      if (dropDownValue.value == buildingDetails[i]['name']) {
        buildingId.value = buildingDetails[i]['id'].toString();
        //print(buildingDetails[i]['id'].toString());
        await _userDataController
            .storeBuildingId(buildingDetails[i]['id'].toString());
        print(buildingDetails[i]['id'].toString());
      }
    }
  }

  void registerApi() {
    loading.value = true;
    update();
    var data = {
      "username": userNameController.value.text,
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "password2": confirmPasswordController.value.text,
      "building": buildingId.value
    };

    if (dropDownValue.value.contains('Select Your Residential')) {
      loading.value = false;
      update();
      Utils.snackBar('Error', 'Select Your Residential', action: 'error');
    } else {
      _api.registerApi(data).then((value) {
        Utils.snackBar("Registration ", "Successfully Registered",
            action: "success");
        emailController.value.clear();
        passwordController.value.clear();
        // buildingId.value.clear();
        _mainScreenController.setIndex(0);
        Get.offAllNamed(RoutesName.authMainScreen);
        update();
        // Get.toNamed(RoutesName.loginScreen);
      }).onError((error, stackTrace) {
        loading.value = false;
        update();
        var errorr = jsonDecode(error.toString());
        print(errorr.toString());
        Utils.snackBar(
            "Error",
            emailController.value.text.isEmpty &&
                    passwordController.value.text.isEmpty
                ? "${"Email: " + errorr['username'][0]}\nPassword: " +
                    errorr['password'][0]
                : emailController.value.text.isEmail == false &&
                        passwordController.value.text.isEmpty
                    ? "${errorr['email'][0] + "\nPassword: " + errorr['password'][0]}"
                    : emailController.value.text.isEmpty
                        ? "Email: " + errorr['userName'][0]
                        : passwordController.value.text.isEmpty
                            ? "Password: " + errorr['password'][0]
                            : emailController.value.text.isEmail == false
                                ? "Email: " + errorr['email'][0]
                                : errorr['username'][0],
            action: "error");
      });
    }
  }
}
