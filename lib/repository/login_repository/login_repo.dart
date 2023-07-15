import 'package:saif_app/data/networks/network_api_services.dart';
import 'package:saif_app/resources/app_url/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiService();
  Future<dynamic> loginApi(var data) {
    dynamic response = _apiServices.postApi(data:data,url: AppUrl.loginUrl);

    return response;
  }
}
