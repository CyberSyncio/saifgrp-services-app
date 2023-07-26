import '../../data/networks/network_api_services.dart';
import '../../utils/app_url/app_url.dart';

class ServicesRepository {
  final _apiServices = NetworkApiService();

  getServices() async {
    var response = await _apiServices.getApi(url: AppUrl.serviceUrl);

    return response;
  }
}
