import 'package:get/get.dart';
import 'package:saif_app/views/home_screens/Request/history.dart';
import 'package:saif_app/views/home_screens/Request/request_screen.dart';
import 'package:saif_app/views/home_screens/drawer_screen/aboutus_screen.dart';
import 'package:saif_app/views/home_screens/drawer_screen/change_password_screen.dart';
import 'package:saif_app/views/auth/forget_password_screen.dart';
import 'package:saif_app/views/auth/login.dart';
import 'package:saif_app/views/auth/sign_up.dart';
import 'package:saif_app/views/auth/update_profile_screen.dart';
import 'package:saif_app/views/home_screens/drawer_screen/complaint_screen.dart';
import 'package:saif_app/views/home_screens/drawer_screen/faq_screen.dart';
import 'package:saif_app/views/home_screens/home_main_screen.dart';
import 'package:saif_app/views/splashscreen/splash.dart';

import '../../views/home_screens/services.dart';
import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          //
          name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: RoutesName.loginScreen,
          page: () => Login(),
        ),
        GetPage(
          name: RoutesName.forgetPasswordScreen,
          page: () => ForgetPasswordScreen(),
        ),
        GetPage(
          name: RoutesName.changePasswordScreen,
          page: () => ChangePasswordScreen(),
        ),
        GetPage(
          name: RoutesName.registerScreen,
          page: () => const Register(),
        ),
        GetPage(
          name: RoutesName.dasboardScreen,
          page: () => const HomeMainScreen(),
        ),
        GetPage(
          name: RoutesName.serviceScreen,
          page: () => const ServiceScreen(),
        ),
        GetPage(
          name: RoutesName.historyScreen,
          page: () => const History(),
        ),
        GetPage(
          name: RoutesName.reqdashboardScreen,
          page: () => RequestScreen(),
        ),
        GetPage(
          name: RoutesName.updateProfileScreen,
          page: () => const UpdateProfileScreen(),
        ),
        GetPage(
          name: RoutesName.faqScreen,
          page: () => const FaqScreen(),
        ),
        GetPage(
          name: RoutesName.aboutScreen,
          page: () => const AboutScreen(),
        ),
        GetPage(
          name: RoutesName.complainScreen,
          page: () => const ComplaintScreen(),
        ),
        GetPage(
          name: RoutesName.homeScreen,
          page: () => const HomeMainScreen(),
        ),
      ];
}
