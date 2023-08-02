import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectivityController extends GetxController {
  Rx<ConnectivityResult?> connectivityResult = Rx<ConnectivityResult?>(null);

  @override
  void onInit() {
    super.onInit();
    checkConnectivity();
  }

  checkConnectivity() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectivityResult.value = result;
    });
  }
}