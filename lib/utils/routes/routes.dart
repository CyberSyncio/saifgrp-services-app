import 'package:get/get.dart';
import 'package:myapp/views/auth_screen/auth_main_screen.dart';
import 'package:myapp/views/auth_screen/register_screen.dart';
import 'package:myapp/views/home_screens/profile_screen/change_password_screen.dart';
import 'package:myapp/views/home_screens/service_history_screen/service_history_screen.dart.dart';
import 'package:myapp/views/welcome_screen.dart';
import '../../views/auth_screen/login_screen.dart';
import '../../views/home_main_screen.dart';
import '../../views/home_screens/service_screens/allServicesScreen.dart';
import '../../views/home_screens/service_screens/complaintFormScreen.dart';
import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.serviceScreen,
          page: () => AllServicesScreen(),
        ),
        GetPage(
          name: RoutesName.authMainScreen,
          page: () => const AuthMainScreen(),
        ),
        GetPage(
          name: RoutesName.registerScreen,
          page: () => const RegisterScreen(),
        ),
        GetPage(
          name: RoutesName.welcomeScreen,
          page: () => WelcomeScreen(),
        ),
        GetPage(
          name: RoutesName.homeMainScreen,
          page: () => const HomeMainScreen(),
        ),
        GetPage(
          name: RoutesName.loginScreen,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: RoutesName.complaintFormScreen,
          page: () => const ComplaintFormScreen(),
        ),
        GetPage(
          name: RoutesName.serviceHistoryScreen,
          page: () => const ServiceHistoryScreen(),
        ),
        GetPage(
          name: RoutesName.changPasswordScreen,
          page: () => const ChangePasswordScreen(),
        ),
      ];
}
