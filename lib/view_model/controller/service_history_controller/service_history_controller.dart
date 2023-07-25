import 'package:get/get.dart';
import 'package:myapp/view_model/controller/login%20controller/login_screen_controller.dart';

import '../../../repository/service_history_repository/service_history_repository.dart';
import '../user_session_controller/store_user_data.dart';

class ServiceHistoryController extends GetxController {
  final _requestHistory = ServiceHistoryRepository();
  List requestList = [].obs;
  RxBool isLoading = true.obs;
  final StoreUserData _userToken = Get.put(StoreUserData());
  final LoginController _loginController = LoginController();
  Map<String, String> _header = {};
  String _token = '';
  bool? checkLogin;
  @override
  void onInit() async {
    print(_loginController.usertoken.value.toString());
    print(_loginController.check.value.toString());
    checkLogin = await _userToken.getLoginStatus();
    if (checkLogin!) {
      _token = await _userToken.getToken();
    } else {
      print(
          "Value of Login Controller inside Servicce History${_loginController.userToken()}");
      _token = _loginController.usertoken.value;
    }
    print(_token);

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
