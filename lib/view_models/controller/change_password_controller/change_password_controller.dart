import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saif_app/utils/utils.dart';

import '../../../repository/change_password_repository/change_password_repository.dart';
import '../store user session/store_user_data.dart';

class ChangePasswordController extends GetxController {
  final confirmPasswordController = TextEditingController().obs;
  final confirmPasswordFocusNode = FocusNode().obs;
  final passwordController = TextEditingController().obs;
  final passwordFocusNode = FocusNode().obs;
  final currentpasswordController = TextEditingController().obs;
  final currentpasswordFocusNode = FocusNode().obs;
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
    var data = {
      "new_password1": passwordController.value.text,
      "new_password2": confirmPasswordController.value.text
    };

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
        // Perform any additional actions after the password is updated
      } else {
        Utils.snackBar("Error", "Failed to update password");
      }
    } catch (error) {
      loading.value = false;
      Utils.snackBar("Error", "Failed to update password: $error");
    }
  }
}
