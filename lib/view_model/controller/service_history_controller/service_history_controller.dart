import 'package:get/get.dart';
import 'package:myapp/view_model/controller/login%20controller/login_screen_controller.dart';

import '../../../repository/service_history_repository/service_history_repository.dart';
import '../user_session_controller/store_user_data.dart';

class ServiceHistoryController extends GetxController {
  final _requestHistory = ServiceHistoryRepository();
  List requestList = [].obs;
  RxBool isLoading = true.obs;
  final StoreUserData _userToken = Get.put(StoreUserData());
  final LoginController _loginController = Get.put(LoginController());
  Map<String, String> _header = {};
  String _token = '';
  bool? checkLogin;
  @override
  void onInit() async {
    checkLogin = await _userToken.getLoginStatus();
    if (checkLogin!) {
      _token = await _userToken.getToken();
    } else {
      _token = _loginController.userToken;
    }

    _header = {'authorization': 'Token $_token'};

    await getRequestHistory();
    super.onInit();
  }

  getRequestHistory() async {
    requestList = await _requestHistory.requestHistory(_header);
    isLoading.value = false;
    update();
  }
}
