import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saif_app/repository/forget_password_repository/forget_passsword_repository.dart';
import 'package:saif_app/utils/utils.dart';

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
      Utils.snackBar("", "Password reset e-mail has been sent to your account");
    }).onError((error, stackTrace) {
      print(error.toString());
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
