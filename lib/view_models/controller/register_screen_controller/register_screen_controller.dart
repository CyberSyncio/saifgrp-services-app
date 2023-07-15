import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saif_app/resources/routes/routes_name.dart';
import 'package:saif_app/utils/utils.dart';
import '../../../repository/register_repository/register_repository.dart';
import '../building_controller/building_controller.dart';
import '../store user session/store_user_data.dart';

class RegisterController extends GetxController {
//>>>>>>>>>>>>>>>>>>>>>> EDITING CONTROLLER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final confirmPasswordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  final dropDownValue = 'select your Residential'.obs;
  var buildingId = ''.obs;

  final StoreUserData _userDataController = StoreUserData();
  //>>>>>>>>>>>>>>>>>>>>>> POST API CALL OF REPO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  final _api = RegisterRepository();
  List buildingDetails = [].obs;
  List<String> buildingList = [];
  final BuildingController _building = Get.put(BuildingController());
  @override
  void onInit() async {
    getBuildingDetails();
    super.onInit();
  }

  getBuildingDetails() {
    for (var i = 0; i < _building.buildingModel.length; i++) {
      buildingDetails.add({
        'id': _building.buildingModel[i]['id'],
        'name': _building.buildingModel[i]['name']
      });
    }
    buildingList.add(dropDownValue.value);
    for (var i = 1; i < _building.buildingModel.length; i++) {
      buildingList.add(_building.buildingModel[i]['name']);
    }

    update();
  }

  getBuildingId() async {
    for (int i = 0; i < buildingDetails.length; i++) {
      if (dropDownValue.value == buildingDetails[i]['name']) {
        buildingId.value = buildingDetails[i]['id'].toString();
        //print(buildingDetails[i]['id'].toString());
        await _userDataController
            .storeBuildingId(buildingDetails[i]['id'].toString());
      }
    }
    print(_userDataController.buildingId.value);
  }

  void registerApi() {
    loading.value = true;
    var userName = emailController.value.text.split('@');
    var userName1 = userName[0];
    var data = {
      "username": userName1,
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "password2": confirmPasswordController.value.text,
      "building": buildingId.value
    };
    _api.registerApi(data).then((value) {
      loading.value = false;
      Utils.snackBar("Registration ", "Sucessfully Registered",
          action: "success");
      Get.toNamed(RoutesName.loginScreen);
    }).onError((error, stackTrace) {
      print(error.toString());
      loading.value = false;
      Utils.snackBar("Error", 'Something Went Wrong Please Try Again',
          action: "error");
    });
  }
}
