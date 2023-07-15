import 'package:get/get.dart';
import 'package:saif_app/repository/building_repository/building_repository.dart';

class BuildingController extends GetxController {
  final _buildingRepo = BuildingRepository();
  List buildingModel = [].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    await getBuilding();
    super.onInit();
  }

  getBuilding() async {
    buildingModel = await _buildingRepo.getAllBuildings();
    isLoading.value = false;
    update();
  }
}
