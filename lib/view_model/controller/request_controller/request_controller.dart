import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repository/request_repository/request_repository.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../user_session_controller/store_user_data.dart';

class RequestController extends GetxController {
  final nameController = TextEditingController().obs;
  final nameFocusNode = FocusNode().obs;
  final descriptionController = TextEditingController().obs;
  final descriptionFocusNode = FocusNode().obs;
  final flatNoController = TextEditingController().obs;
  final flatNoFocusNode = FocusNode().obs;
  final phoneNoController = TextEditingController().obs;
  final phoneNoFocusNode = FocusNode().obs;
  final StoreUserData _userToken = Get.put(StoreUserData());
  Map<String, String>? _header;
  String? _token;
  RxBool loading = false.obs;
  final _api = RequestRepository();
  dynamic argumentData = Get.arguments;
  bool? checkLogin;
  final oneTimeToken = ''.obs;
  @override
  onInit() async {
    _token = await _userToken.getToken();
    _header = {'authorization': 'Token $_token'};
    super.onInit();
  }

  requestApi() async {
    loading = true.obs;
    update();
    var data = {
      "service": argumentData.toString(),
      "flat_number": flatNoController.value.text,
      "phone_number": phoneNoController.value.text,
      "description": descriptionController.value.text,
    };
    await _api.requestApi(data, _header).then((value) {
      Utils.snackBar("Request", "Request is Sent Successfully",
          action: 'success');
      nameController.value.clear();
      flatNoController.value.clear();
      phoneNoController.value.clear();
      descriptionController.value.clear();

      // Clear the text after successful request
      Get.offAndToNamed(RoutesName.homeMainScreen);
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

  setOneTimeToken(String token) {
    oneTimeToken.value = token;
  }
}
