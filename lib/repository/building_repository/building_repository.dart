
import '../../data/networks/network_api_services.dart';
import '../../utils/app_url/app_url.dart';

class BuildingRepository {
  final _apiServices = NetworkApiService();
  getAllBuildings() async {
    var response = await _apiServices.getApi(url:AppUrl.buildingUrl);
    //  print(response);
    return response;
  }
}
