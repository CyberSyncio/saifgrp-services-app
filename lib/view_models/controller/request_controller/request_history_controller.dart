import 'package:get/get.dart';
import 'package:saif_app/repository/request_repository/request_history_repository.dart';

import '../store user session/store_user_data.dart';

class RequestHistoryController extends GetxController {
  final _requestHistory = RequestHistoryRepository();
  List requestList = [].obs;
  RxBool isLoading = true.obs;
  final StoreUserData _userToken = Get.put(StoreUserData());
  Map<String, String> _header = {};
  String _token = '';

  @override
  void onInit() async {
    _token = await _userToken.getToken();
    print('value of token inside Request Init Method $_token');
    _header = {'authorization': 'Token $_token'};
    await getRequestHistory();
    super.onInit();
  }

  getRequestHistory() async {
    requestList = await _requestHistory.requestHistory(_header);
    isLoading.value = false;
    print(requestList);
    update();
  }
}
