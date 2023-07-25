import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/change_password_repository/change_password_repository.dart';

import '../../../utils/utils.dart';
import '../user_session_controller/store_user_data.dart';

class ChangePasswordController extends GetxController {
  final confirmPasswordController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final currentpasswordController = TextEditingController().obs;
  RxBool loading = false.obs;
  final StoreUserData _userToken = Get.put(StoreUserData());
  Map<String, String>? _header;
  String? _token;
  final _api = ChangePasswordRepository();

  @override
  void onInit() async {
    _token = await _userToken.getToken();
    _header = {'authorization': 'Token $_token'};
    super.onInit();
  }

  void changePasswordApi() async {
    loading.value = true;
    update();
    var data = {
      "new_password1": passwordController.value.text,
      "new_password2": confirmPasswordController.value.text
    };

    await _api.changePasswordApi(_header, data).then((value) {
      {
        Utils.snackBar('', value['detail']);
        loading.value = false;
        update();
      }
    }).onError((error, stackTrace) {
      var errorr = jsonDecode(error.toString());
      String errorMessage = '';
      for (var entry in errorr.entries) {
        String fieldName = entry.key == 'non_field_errors' ? '' : entry.key;
        List<String> errorMessages = (entry.value as List).cast<String>();
        errorMessage +=
            '${capitalizeFirstLetter(fieldName)}${entry.key == 'non_field_errors' ? '' : ':'} ${errorMessages.map((msg) => capitalizeFirstLetter(msg)).join(', ')}\n';
      }
      Utils.snackBar('Error', errorMessage, action: 'error');
      loading.value = false;
      update();
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
