import 'package:saif_app/data/networks/network_api_services.dart';
import 'package:saif_app/resources/app_url/app_url.dart';

class RequestHistoryRepository {
  final _apiServiceHistory = NetworkApiService();
  Future requestHistory(var header) async {
    dynamic response = await _apiServiceHistory.getApi(
        url: AppUrl.complaintHistoryUrl, header: header);
    return response;
  }
}
