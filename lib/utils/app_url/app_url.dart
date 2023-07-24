class AppUrl {
  static const String baseUrl = "https://cybersyncdev.pythonanywhere.com";
  static const String registerUrl = "$baseUrl/auth/registration/";
  static const String loginUrl = "$baseUrl/auth/login/";
  static const String updateUrl = "$baseUrl/auth/password/change/";
  static const String forgetUrl = "$baseUrl/auth/password/reset/";
  static const String logoutUrl = "$baseUrl/auth/logout/";
  static const String updateProfileUrl = "$baseUrl/auth/user/";
  static const String serviceUrl = "$baseUrl/api/v1/services/";
  static const String requestUrl = "$baseUrl/api/v1/requests/create/";
  static const String buildingUrl = "$baseUrl/api/v1/buildings/";
  static const String complaintHistoryUrl = "$baseUrl/api/v1/requests/";
}
