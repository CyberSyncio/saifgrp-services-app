import '../../data/networks/network_api_services.dart';
import '../../utils/app_url/app_url.dart';

class RegisterRepository {
  final _apiServices = NetworkApiService();
  Future<dynamic> registerApi(var data) {
    dynamic response =
        _apiServices.postApi(data: data, url: AppUrl.registerUrl);
    return response;
  }
}
