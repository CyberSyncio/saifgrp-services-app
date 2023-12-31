import 'package:get/get.dart';
import 'package:myapp/view_model/controller/all_services_controller/all_services_controller.dart';
import '../../../repository/building_repository/building_repository.dart';

class BuildingController extends GetxController {
  final _buildingRepo = BuildingRepository();
  var service = Get.put(AllServicesController());
  List buildingModel = [].obs;
  RxBool isLoading = true.obs;
  RxBool isRefresh = true.obs;
  @override
  void onInit() async {
    await getBuilding();
    service.getServices();
    super.onInit();
  }

  homeScreenRefresher() async {
    service.getServices();
    await getBuilding();
  }

  getBuilding() async {
    try {
      buildingModel = await _buildingRepo.getAllBuildings();
      isLoading = false.obs;
      isRefresh = false.obs;

      update();
    } catch (e) {
      isLoading = false.obs;
      isRefresh = false.obs;

      update();
    }
  }
}
