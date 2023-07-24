import 'package:get/get.dart';
import 'package:myapp/views/auth_screen/auth_main_screen.dart';
import 'package:myapp/views/auth_screen/register_screen.dart';
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
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 900),
        ),
        GetPage(
          name: RoutesName.authMainScreen,
          page: () => const AuthMainScreen(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 900),
        ),
        GetPage(
          name: RoutesName.registerScreen,
          page: () => const RegisterScreen(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 900),
        ),
        GetPage(
          name: RoutesName.welcomeScreen,
          page: () => WelcomeScreen(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 900),
        ),
        GetPage(
          name: RoutesName.homeMainScreen,
          page: () => const HomeMainScreen(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 900),
        ),
        GetPage(
          name: RoutesName.loginScreen,
          page: () => const LoginScreen(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 900),
        ),
        GetPage(
          name: RoutesName.complaintFormScreen,
          page: () => const ComplaintFormScreen(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 900),
        ),
        GetPage(
          name: RoutesName.serviceHistoryScreen,
          page: () => const ServiceHistoryScreen(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 900),
        ),
      ];
}
