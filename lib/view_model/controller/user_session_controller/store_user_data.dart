import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreUserData extends GetxController {
  SharedPreferences? _preferences;
  SharedPreferences? _buildingPreference;
  final RxBool isLoggedIn = false.obs;
  final RxString token = ''.obs;

  @override
  void onInit() async {
    _preferences = await SharedPreferences.getInstance();
    _buildingPreference = await SharedPreferences.getInstance();
    super.onInit();
    checkLoginStatus();
    update();
  }

  Future<void> checkLoginStatus() async {
    _preferences = await SharedPreferences.getInstance();
    isLoggedIn.value = _preferences!.getBool('isLoggedIn') ?? false;
    if (isLoggedIn.value) {
      token.value = _preferences!.getString('token') ?? '';
    }
    update();
  }

  Future<void> login(String userToken) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences!.setBool('isLoggedIn', true);
    await _preferences!.setString('token', userToken);
    isLoggedIn.value = true;
    token.value = userToken;

    update();
  }

  Future<void> logout() async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences!.setBool('isLoggedIn', false);
    await _preferences!.remove('token');
    isLoggedIn.value = false;
    token.value = '';
    update();
  }

  Future<void> storeBuildingId(String buildingId) async {
    _buildingPreference = await SharedPreferences.getInstance();
    await _buildingPreference!.setString('buildingId', buildingId);
    update();
  }

  Future<String> getToken() async {
    _preferences = await SharedPreferences.getInstance();
    token.value = _preferences!.getString('token')!;
    return token.value;
  }
}
