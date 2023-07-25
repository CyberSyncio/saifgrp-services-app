// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/login_repository/login_repo.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../user_session_controller/store_user_data.dart';

class LoginController extends GetxController {
//>>>>>>>>>>>>>>>>>>>>>> EDITING CONTROLLER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final check = false.obs;
  final usertoken = ''.obs;
  final loading = false.obs;
  StoreUserData userData = Get.put(StoreUserData());
  //>>>>>>>>>>>>>>>>>>>>>> POST API CALL OF REPO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  final _api = LoginRepository();
  loginApi() {
    loading.value = true;
    update();
    var data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };
    _api.loginApi(data).then((value) async {
      if (check.value) {
        print("Inside if True status" + check.value.toString());
        await userData.login(value['key'], check.value);
      } else {
        print("Inside if Else status" + check.value.toString());
        await userData.login('', check.value);
        print(value['key'].toString());
        usertoken.value = value['key'].toString();
        print('value of token in login Controller is ' + usertoken.value);
      }
      print('Value of Check inside Login Controller' + check.value.toString());
      Get.offAllNamed(RoutesName.homeMainScreen);
      emailController.value.clear();
      passwordController.value.clear();
      loading.value = false;
      update();
    }).onError((error, stackTrace) {
      loading.value = false;
      var errorr = jsonDecode(error.toString());
      if (emailController.value.text.isEmpty) {
        Utils.snackBar('Error', "Email :" + errorr['non_field_errors'][0],
            action: 'error');
      } else if (emailController.value.text.isEmail == false &&
          emailController.value.text.isNotEmpty &&
          passwordController.value.text.isNotEmpty) {
        Utils.snackBar('Error', errorr['email'][0], action: 'error');
      } else if (passwordController.value.text.isNotEmpty &&
          emailController.value.text.isNotEmpty &&
          emailController.value.text.isEmail) {
        Utils.snackBar('Error', errorr['non_field_errors'][0], action: 'error');
      } else if (emailController.value.text.isEmpty) {
        Utils.snackBar('Error', "Field: " + errorr['non_field_errors'][0],
            action: 'error');
      } else if (emailController.value.text.isEmpty &&
          passwordController.value.text.isEmpty) {
        Utils.snackBar("Error", errorr['password'][0], action: 'error');
      } else if (emailController.value.text.isEmail == false &&
          passwordController.value.text.isEmpty) {
        Utils.snackBar(
            'Error',
            "${"Email: " + errorr['email'][0]}\n\nPassword :" +
                errorr['password'][0],
            action: 'error');
      } else if (passwordController.value.text.isEmpty) {
        Utils.snackBar('Error', "Password :" + errorr['password'][0],
            action: 'error');
      } else {
        Utils.snackBar('Error', errorr['non_field_errors'][0], action: 'error');
      }
      passwordController.value.clear();
      update();
    });
  }

  String userToken() {
    print(usertoken.value);
    return usertoken.value;
  }
}
