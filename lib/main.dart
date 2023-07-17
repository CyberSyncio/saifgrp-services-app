import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/view_models/controller/store%20user%20session/store_user_data.dart';
import 'package:saif_app/views/splashscreen/splash.dart';

import 'resources/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final StoreUserData sessionController = Get.put(StoreUserData());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Saif App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.firaSansTextTheme(),
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const SplashScreen(),

        //     Obx(() {
        //   return sessionController.isLoggedIn.value
        //       ? const HomeMainScreen()
        //       : Login();
        // }),
        getPages: AppRoutes.appRoutes());
  }
}
