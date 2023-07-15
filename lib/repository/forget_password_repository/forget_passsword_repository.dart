import 'package:saif_app/data/networks/network_api_services.dart';
import 'package:saif_app/resources/app_url/app_url.dart';

class ForgetPasswordRepository {
  final _apiServices = NetworkApiService();
  Future<dynamic> forgetPasswordApi(var data) {
    dynamic response = _apiServices.postApi(data: data, url: AppUrl.forgetUrl);
    print(response.toString());
    return response;
  }
}
