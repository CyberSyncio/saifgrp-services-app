import 'package:get/get.dart';

import '../../../repository/service_history_repository/service_history_repository.dart';
import '../user_session_controller/store_user_data.dart';

class ServiceHistoryController extends GetxController {
  var arg = Get.arguments;
  final _requestHistory = ServiceHistoryRepository();
  List requestList = [].obs;
  RxBool isLoading = true.obs;
  final StoreUserData _userToken = Get.put(StoreUserData());

  Map<String, String> _header = {};
  String _token = '';
  final oneTimeToken = ''.obs;
  bool? checkLogin;
  @override
  void onInit() async {
    _token = await _userToken.getToken();

    _header = {'authorization': 'Token $_token'};

    await getRequestHistory();
    super.onInit();
  }

  getRequestHistory() async {
    requestList = await _requestHistory.requestHistory(_header);
    isLoading.value = false;
    update();
  }

  setOneTimeToken(String token) {
    oneTimeToken.value = token;
  }
}
