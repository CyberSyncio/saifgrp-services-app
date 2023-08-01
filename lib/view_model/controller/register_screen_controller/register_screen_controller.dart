import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/routes/routes_name.dart';

import '../../../repository/register_repository/register_repository.dart';
import '../../../utils/utils.dart';
import '../auth_controller/auth_controller.dart';
import '../building_controller/building_controller.dart';

class RegisterController extends GetxController {
//>>>>>>>>>>>>>>>>>>>>>> EDITING CONTROLLER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  final userNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final userNameFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final confirmPasswordController = TextEditingController().obs;
  final confirmPasswordFocusNode = FocusNode().obs;
  final loading = false.obs;
  final dropDownValue = 'Select Your Residential'.obs;
  List buildingDetails = [].obs;
  List<String> buildingList = [];
  final buildingId = ''.obs;
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
    buildingDetails.clear(); // Clear the list before adding new items
    //  buildingList.clear();
    for (var i = 0; i < _building.buildingModel.length; i++) {
      buildingDetails.add({
        'id': _building.buildingModel[i]['id'],
        'name': _building.buildingModel[i]['name']
      });
    }
    if (!buildingList.contains(dropDownValue.value)) {
      buildingList.add(dropDownValue.value);
    }

    for (var i = 0; i < buildingDetails.length; i++) {
      buildingList.add(buildingDetails[i]['name']);
    }
    getBuildingId();
  }

  getBuildingId() async {
    for (int i = 0; i < buildingDetails.length; i++) {
      if (dropDownValue.value == buildingDetails[i]['name']) {
        buildingId.value = buildingDetails[i]['id'].toString();
      }
    }
  }

  void registerApi() async {
    loading.value = true;
    update();
    var data = {
      "username": userNameController.value.text,
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "password2": confirmPasswordController.value.text,
      "building": buildingId.value
    };
    await _api.registerApi(data).then((value) {
      Utils.snackBar("Registration ", "Successfully Registered",
          action: "success");
      emailController.value.clear();
      passwordController.value.clear();
      _mainScreenController.setIndex(0);
      Get.offAllNamed(RoutesName.authMainScreen);
      loading.value = false;
      update();
    }).onError((error, stackTrace) {
      var errorr = jsonDecode(error.toString());
      String errorMessage = '';
      for (var entry in errorr.entries) {
        String fieldName = entry.key;
        List<String> errorMessages = (entry.value as List).cast<String>();
        errorMessage +=
            '${capitalizeFirstLetter(fieldName)}: ${errorMessages.map((msg) => capitalizeFirstLetter(msg)).join(', ')}\n';
      }
      Utils.snackBar('Error', errorMessage, action: 'error');
    });
    loading.value = false;
    update();
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }
}
