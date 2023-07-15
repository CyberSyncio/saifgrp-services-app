import 'package:saif_app/data/networks/network_api_services.dart';
import 'package:saif_app/resources/app_url/app_url.dart';

class ServicesRepository {
  final _apiServices = NetworkApiService();

  getServices() async {
    var response = await _apiServices.getApi(url: AppUrl.serviceUrl);
    return response;
  }
}
