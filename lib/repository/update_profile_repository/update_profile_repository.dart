
import '../../data/networks/network_api_services.dart';
import '../../utils/app_url/app_url.dart';

class UpdateProfileRepository {
  final _apiServices = NetworkApiService();
  Future<dynamic> updateProfileApi(var data, var header) {
    dynamic response = _apiServices.putApi(
        data: data, url: AppUrl.updateProfileUrl, header: header);
    return response;
  }

  Future<dynamic> getUserDetailApi(var header) {
    dynamic response =
        _apiServices.getApi(url: AppUrl.updateProfileUrl, header: header);

    return response;
  }
}
