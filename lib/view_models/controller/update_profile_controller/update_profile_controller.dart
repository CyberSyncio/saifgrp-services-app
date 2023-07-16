import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saif_app/utils/utils.dart';

import '../../../repository/update_profile_repository/update_profile_repository.dart';
import '../store user session/store_user_data.dart';

class UpdateProfileController extends GetxController {
  final userNameController = TextEditingController().obs;
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final userNameFocusNode = FocusNode().obs;
  final firstNameFocusNode = FocusNode().obs;
  final lastNameFocusNode = FocusNode().obs;
  var _userData = {};
  RxBool loading = false.obs;
  RxBool isRefresh = true.obs;
  final StoreUserData _userToken = Get.put(StoreUserData());
  Map<String, String>? _header;
  String _token = '';
  final _api = UpdateProfileRepository();

  @override
  void onInit() async {
    print('controller is created');
    _token = await _userToken.getToken();
    _header = {'authorization': 'Token $_token'};
    await getUserDetailApi();
    super.onInit();
  }

  // @override
  // onClose() {
  //   userNameController.value.clear();
  //   firstNameController.value.clear();
  //   lastNameController.value.clear();
  //   print('data is cleared');
  // }

  getUserDetailApi() {
    _api.getUserDetailApi(_header).then((value) async {
      loading.value = false;
      _userData = value;
      isRefresh = false.obs;
      userNameController.value.text = _userData['username'];
      firstNameController.value.text = _userData['first_name'];
      lastNameController.value.text = _userData['last_name'];
    });
    update();
  }

  updateProfileApi() {
    loading.value = true;
    var data = {
      "username": userNameController.value.text,
      "first_name": firstNameController.value.text,
      "last_name": lastNameController.value.text,
    };
    _api.updateProfileApi(data, _header).then((value) async {
      loading.value = false;
      _userData = value;
      isRefresh = false.obs;
      print(value);
      Utils.snackBar("Success", "Profile updated successfully",
          action: "success");
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString(), action: "error");
    });
  }
}
