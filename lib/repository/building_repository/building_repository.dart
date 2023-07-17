import 'package:saif_app/data/networks/network_api_services.dart';
import 'package:saif_app/resources/app_url/app_url.dart';

class BuildingRepository {
  final _apiServices = NetworkApiService();
  getAllBuildings() async {
    var response = await _apiServices.getApi(url:AppUrl.buildingUrl);

    return response;
  }
}
