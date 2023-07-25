import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view_model/controller/login%20controller/login_screen_controller.dart';

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
  final loading = false.obs;
  final _api = RequestRepository();
  final LoginController _loginController = Get.put(LoginController());
  dynamic argumentData = Get.arguments;
  String buildingId = '';
  bool? checkLogin;
  @override
  onInit() async {
    checkLogin = await _userToken.getLoginStatus();
    if (checkLogin!) {
      _token = await _userToken.getToken();
    } else {
      _token = _loginController.userToken();
    }

    buildingId = await _userToken.getBuildingId() ?? "2";
    _header = {'authorization': 'Token $_token'};
    super.onInit();
  }

  requestApi() async {
    final loading = true.obs;
    update();
    var data = {
      "service": argumentData.toString(),
      "building": buildingId,
      "flat_number": flatNoController.value.text,
      "phone_no": phoneNoController.value.text,
      "description": descriptionController.value.text,
    };
    nameController.value.text.isEmpty &&
            flatNoController.value.text.isEmpty &&
            phoneNoController.value.text.isEmpty &&
            descriptionController.value.text.isEmpty
        ? Utils.snackBar('Error', 'All Field Are Required To Be Filled',
            action: 'error')
        : nameController.value.text.isEmpty &&
                flatNoController.value.text.isEmpty
            ? Utils.snackBar(
                'Error', 'Name Are Required To Be Filled \n\nFlat No Are Required To Be Filled',
                action: 'error')
            : nameController.value.text.isEmpty &&
                    phoneNoController.value.text.isEmpty
                ? Utils.snackBar(
                    'Error', 'Name Are Required To Be Filled \n\nPhone No Are Required To Be Filled',
                    action: 'error')
                : nameController.value.text.isEmpty &&
                        descriptionController.value.text.isEmpty
                    ? Utils.snackBar(
                        'Error', 'Name Are Required To Be Filled \n\nDescription Are Required To Be Filled',
                        action: 'error')
                    : flatNoController.value.text.isEmpty &&
                            phoneNoController.value.text.isEmpty
                        ? Utils.snackBar(
                            'Error', 'Flat No Are Required To Be Filled \n\nPhone No Are Required To Be Filled',
                            action: 'error')
                        : flatNoController.value.text.isEmpty &&
                                descriptionController.value.text.isEmpty
                            ? Utils.snackBar('Error',
                                'Flat No Are Required To Be Filled \n\nDescription No Are Required To Be Filled',
                                action: 'error')
                            : phoneNoController.value.text.isEmpty &&
                                    descriptionController.value.text.isEmpty
                                ? Utils.snackBar('Error', 'Phone No Are Required To Be Filled \n\nDescription No Are Required To Be Filled', action: 'error')
                                : phoneNoController.value.text.isEmpty
                                    ? Utils.snackBar('Error', 'Phone No Are Required To Be Filled', action: 'error')
                                    : flatNoController.value.text.isEmpty
                                        ? Utils.snackBar('Error', 'Flat No Are Required To Be Filled', action: 'error')
                                        : nameController.value.text.isEmpty
                                            ? Utils.snackBar('Error', 'Name Are Required To Be Filled', action: 'error')
                                            : descriptionController.value.text.isEmpty
                                                ? Utils.snackBar('Error', 'Description Are Required To Be Filled', action: 'error')
                                                : phoneNoController.value.text.length < 11 || phoneNoController.value.text.length > 11
                                                    ? Utils.snackBar('Error', 'Please Enter 11 Digits Number', action: 'error')
                                                    : await _api.requestApi(data, _header).then((value) {
                                                        Utils.snackBar(
                                                            "Request",
                                                            "Request is Sent Successfully",
                                                            action: 'success');
                                                        nameController.value
                                                            .clear();
                                                        flatNoController.value
                                                            .clear();
                                                        phoneNoController.value
                                                            .clear();
                                                        descriptionController
                                                            .value
                                                            .clear();

                                                        // Clear the text after successful request
                                                        Get.offAndToNamed(
                                                            RoutesName
                                                                .homeMainScreen);
                                                      }).onError((error, stackTrace) {
                                                        final loading =
                                                            false.obs;
                                                        update();
                                                        print(error.toString());
                                                        Utils.snackBar("Error",
                                                            "Something Went Wrong Please Try Again",
                                                            action: 'error');
                                                      });
  }
}
