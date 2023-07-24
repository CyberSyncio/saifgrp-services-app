import 'package:get/get.dart';

import '../building_controller/building_controller.dart';

class AuthMainScreenController extends GetxController {
  var index = 0.obs;

@override
  onInit() {
      Get.put(BuildingController());
    super.onInit();
  }

  setIndex(var index) async {
    this.index.value = index;

   
    update();
  }

  get getIndex => index.value;
}
