// ignore_for_file: empty_catches

import 'package:get/get.dart';
import '../../../repository/all_services_repository/all_services_repository.dart';

class AllServicesController extends GetxController {
  final _servicesRepo = ServicesRepository();
  List serviceListModel = [].obs;
  RxBool isLoading = true.obs;
  RxBool isRefresh = true.obs;
  @override
  void onInit() async {
    await getServices();
    super.onInit();
  }

  getServices() async {
    try {
      serviceListModel = await _servicesRepo.getServices();
      print(serviceListModel);
    } catch (e) {}
    isRefresh = false.obs;
    isLoading = false.obs;
    update();
  }
}
