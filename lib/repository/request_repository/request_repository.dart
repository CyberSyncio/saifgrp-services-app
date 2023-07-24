
import '../../data/networks/network_api_services.dart';
import '../../utils/app_url/app_url.dart';

class RequestRepository {
  final _apiServices = NetworkApiService();
  Future<dynamic> requestApi(var data,var header) {
    dynamic response = _apiServices.postApi(data: data,header :header, url: AppUrl.requestUrl);

    return response;
  }
}
