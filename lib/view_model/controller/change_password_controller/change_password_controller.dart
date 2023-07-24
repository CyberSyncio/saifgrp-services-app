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
  final StoreUserData _userData = Get.put(StoreUserData());

  @override
  void onInit() async {
    _token = await _userToken.getToken();
    _header = {'authorization': 'Token $_token'};
    super.onInit();
  }

  void changePasswordApi() async {
    loading.value = true;
    update();

    String newPassword1 = passwordController.value.text;
    String newPassword2 = confirmPasswordController.value.text;

    if (newPassword1 != newPassword2) {
      Utils.snackBar("Error", "New password and confirm password mismatched",
          action: "error");
      loading.value = false;
      update();
    } else {
      var data = {"new_password1": newPassword1, "new_password2": newPassword2};

      try {
        var response = await _api.changePasswordApi(_header, data);
        loading.value = false;
        if (response != null) {
          Utils.snackBar("Success", "Password updated successfully",
              action: "success");
          passwordController.value.text = '';
          confirmPasswordController.value.text = '';
          currentpasswordController.value.text = '';
          update();
        } else {
          Utils.snackBar("Error", "Failed to update password", action: "error");
        }
      } catch (error) {
        loading.value = false;
        print(error);
        Utils.snackBar("Error", "Failed to update password: $error",
            action: "error");
      }
    }
  }
}