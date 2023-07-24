
import '../../data/networks/network_api_services.dart';
import '../../utils/app_url/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiService();
  Future<dynamic> loginApi(var data) {
    dynamic response = _apiServices.postApi(data:data,url: AppUrl.loginUrl);

    return response;
  }
}
