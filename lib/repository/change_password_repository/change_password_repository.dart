import 'package:myapp/utils/app_url/app_url.dart';

import '../../data/networks/network_api_services.dart';

class ChangePasswordRepository {
  final _apiServices = NetworkApiService();

  Future<dynamic> changePasswordApi(var header, var data) {
    dynamic response = _apiServices.postApi(
        data: data, header: header, url: AppUrl.updateUrl.trim());

    return response;
  }
}
