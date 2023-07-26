import '../../data/networks/network_api_services.dart';
import '../../utils/app_url/app_url.dart';

class ForgetPasswordRepository {
  final _apiServices = NetworkApiService();
  Future<dynamic> forgetPasswordApi(var data) {
    dynamic response = _apiServices.postApi(data: data, url: AppUrl.forgetUrl);

    return response;
  }
}
