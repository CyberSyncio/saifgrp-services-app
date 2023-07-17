import 'package:saif_app/data/networks/network_api_services.dart';
import 'package:saif_app/resources/app_url/app_url.dart';

class ChangePasswordRepository {
  final _apiServices = NetworkApiService();

  Future<dynamic> changePasswordApi(var header, var data) {
    dynamic response = _apiServices.postApi(
        data: data, header: header, url: AppUrl.updateUrl.trim());
  
    return response;
  }
}
