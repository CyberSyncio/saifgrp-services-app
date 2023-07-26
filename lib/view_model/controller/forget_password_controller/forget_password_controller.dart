// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/forget_password_repository/forget_passsword_repository.dart';
import '../../../utils/utils.dart';

class ForgetPasswordController extends GetxController {
//>>>>>>>>>>>>>>>>>>>>>> EDITING CONTROLLER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  final emailController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  //>>>>>>>>>>>>>>>>>>>>>> POST API CALL OF REPO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  final _api = ForgetPasswordRepository();

  void forgetPasswordApi() {
    loading.value = true;
    var data = {
      "email": emailController.value.text,
    };
    _api.forgetPasswordApi(data).then((value) {
      loading.value = false;
      Utils.snackBar(
          "Success", "Password reset e-mail has been sent to your account",
          action: "success");
    }).onError((error, stackTrace) {
      var errorr = jsonDecode(error.toString());
      loading.value = false;

      Utils.snackBar(
          "Error",
          emailController.value.text.isEmpty
              ? "Email : " + errorr['email'][0]
              : errorr['email'][0],
          action: 'error');
    });
  }
}
