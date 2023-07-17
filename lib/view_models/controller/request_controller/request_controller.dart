import 'package:saif_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saif_app/repository/request_repository/request_repository.dart';
import 'package:saif_app/view_models/controller/store%20user%20session/store_user_data.dart';

class RequestController extends GetxController {
  final descriptionController = TextEditingController().obs;
  final descriptionFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  final StoreUserData _userToken = Get.put(StoreUserData());
  Map<String, String>? _header;
  String? _token;
  final _api = RequestRepository();
  dynamic argumentData = Get.arguments;
  String buildingId = '';
  @override
  void onInit() async {
    _token = await _userToken.getToken();
    ('token inside request controller is $_token');
    buildingId = await _userToken.getBuildingId();
    _header = {'authorization': 'Token $_token'};
    (buildingId);
    super.onInit();
  }

  requestApi() async {
    loading.value = true;
    var data = {
      "service": argumentData,
      "building": buildingId,
      "description": descriptionController.value.text,
    };

    await _api.requestApi(data, _header).then((value) {
      loading.value = false;
      (value);
      Utils.snackBar("Request", "Request is Sent Successfully",
          action: 'success');

      // Clear the text after successful request
      descriptionController.value.clear();
    }).onError((error, stackTrace) {
      loading.value = false;
      (error.toString());
    });
  }
}
