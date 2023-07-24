import '../../data/networks/network_api_services.dart';
import '../../utils/app_url/app_url.dart';

class ServiceHistoryRepository {
  final _apiServiceHistory = NetworkApiService();
  Future requestHistory(var header) async {
    dynamic response = await _apiServiceHistory.getApi(
        url: AppUrl.complaintHistoryUrl, header: header);
    return response;
  }
}
