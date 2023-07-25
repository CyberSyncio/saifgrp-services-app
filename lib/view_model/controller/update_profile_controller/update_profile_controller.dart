import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/routes/routes_name.dart';

import '../../../repository/update_profile_repository/update_profile_repository.dart';
import '../../../utils/utils.dart';
import '../user_session_controller/store_user_data.dart';

class UpdateProfileController extends GetxController {
  final userNameController = TextEditingController().obs;
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final userNameFocusNode = FocusNode().obs;
  final firstNameFocusNode = FocusNode().obs;
  final lastNameFocusNode = FocusNode().obs;
  var arg = Get.arguments;
  var _userData = {};
  RxBool loading = false.obs;
  bool? checkLogin;
  final StoreUserData _userToken = Get.put(StoreUserData());
  Map<String, String>? _header;
  String _token = '';
  final _api = UpdateProfileRepository();
  @override
  void onInit() async {
    _token = await _userToken.getToken();
    _header = {'authorization': 'Token $_token'};
    await getUserDetailApi();
    super.onInit();
  }

  @override
  onClose() {
    userNameController.value.clear();
    firstNameController.value.clear();
    lastNameController.value.clear();
    print('data is cleared');
  }

  getUserDetailApi() {
    _api.getUserDetailApi(_header).then((value) async {
      loading.value = false;
      _userData = value;
      userNameController.value.text = _userData['username'];
      firstNameController.value.text = _userData['first_name'];
      lastNameController.value.text = _userData['last_name'];
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("", "Something Went Wrong While Getting Your Data");
    });
    update();
  }

  updateProfileApi() async {
    loading.value = true;
    update();
    var data = {
      "username": _userData['username'] + "Sheraz",
      "first_name": firstNameController.value.text,
      "last_name": lastNameController.value.text,
    };
    await _api.updateProfileApi(data, _header).then((value) async {
      Get.toNamed(RoutesName.homeMainScreen);
      Utils.snackBar("Profile Update", "Profile updated successfully",
          action: 'success');
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
    // }
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }

    return input[0].toUpperCase() + input.substring(1);
  }
}
