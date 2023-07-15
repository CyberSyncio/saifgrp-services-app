import 'package:get/get.dart';
import '../../../repository/service_repository/service_repository.dart';

class ServicesController extends GetxController {
  final _servicesRepo = ServicesRepository();
  List serviceListModel = [].obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() async {
    await getservices();
    super.onInit();
  }

  getservices() async {
    serviceListModel = await _servicesRepo.getServices();
   
     isLoading = false.obs;
     print(serviceListModel);
    update();
  }
}
