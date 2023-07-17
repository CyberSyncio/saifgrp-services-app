import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saif_app/resources/routes/routes_name.dart';
import 'package:saif_app/utils/utils.dart';
import '../../../repository/register_repository/register_repository.dart';
import '../building_controller/building_controller.dart';
import '../store user session/store_user_data.dart';

class RegisterController extends GetxController {
//>>>>>>>>>>>>>>>>>>>>>> EDITING CONTROLLER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final confirmPasswordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  final dropDownValue = 'select your Residential'.obs;
  var buildingId = ''.obs;

  final StoreUserData _userDataController = StoreUserData();
  //>>>>>>>>>>>>>>>>>>>>>> POST API CALL OF REPO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  final _api = RegisterRepository();
  List buildingDetails = [].obs;
  List<String> buildingList = [];
  final BuildingController _building = Get.put(BuildingController());
  @override
  void onInit() async {
    getBuildingDetails();
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
        // (buildingDetails[i]['id'].toString());
        await _userDataController
            .storeBuildingId(buildingDetails[i]['id'].toString());
      }
    }
    (_userDataController.buildingId.value);
  }

  void registerApi() {
    var userName = emailController.value.text.split('@');
    var userName1 = userName[0];
    var data = {
      "username": userName1,
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "password2": confirmPasswordController.value.text,
      "building": buildingId.value
    };

    if (buildingId.value.isEmpty) {
      Utils.snackBar('Error', 'Kindly Select your Residential Building',
          action: 'error');
    } else {
      _api.registerApi(data).then((value) {
        loading.value = false;
        Utils.snackBar("Registration ", "Successfully Registered",
            action: "success");
        emailController.value.clear();
        passwordController.value.clear();
        confirmPasswordController.value.clear();
        // buildingId.value.clear();
        Get.toNamed(RoutesName.loginScreen);
      }).onError((error, stackTrace) {
        loading.value = false;
        var errorr = jsonDecode(error.toString());

        (error.toString());
        Utils.snackBar(
            "Error",
            emailController.value.text.isEmpty
                // ignore: prefer_interpolation_to_compose_strings
                ? "${" Email: " + errorr['username'][0] + "\nPassword: " + errorr['password'][0]} \nConfirm Password: " +
                    errorr['password2'][0]
                : passwordController.value.text.isEmpty &&
                        emailController.value.text.isEmpty
                    // ignore: prefer_interpolation_to_compose_strings
                    ? "${"Email: " + errorr['username'][0]}\nPassword: " +
                        errorr['password'][0]
                    : confirmPasswordController.value.text.isEmpty &&
                            emailController.value.text.isEmpty
                        // ignore: prefer_interpolation_to_compose_strings
                        ? "${"Email: " + errorr['username'][0]}\nConfirm Password: " +
                            errorr['password2'][0]
                        : passwordController.value.text.isEmpty &&
                                confirmPasswordController.value.text.isEmpty
                            // ignore: prefer_interpolation_to_compose_strings
                            ? "${"Password: " + errorr['password'][0]}\nConfirm Password: " +
                                errorr['password2'][0]
                            : passwordController.value.text.isEmpty
                                // ignore: prefer_interpolation_to_compose_strings
                                ? "Password: " + errorr['password'][0]
                                : confirmPasswordController.value.text.isEmpty
                                    // ignore: prefer_interpolation_to_compose_strings
                                    ? "Confirm Password: " +
                                        errorr['password2'][0]
                                    // ignore: prefer_interpolation_to_compose_strings
                                    : "${errorr['email'][0] + "\nPassword: " + errorr['password'][0]} \nConfirm Password: " +
                                        errorr['password2'][0],
            action: "error");
      });
    }
  }
}
