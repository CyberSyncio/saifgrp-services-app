import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saif_app/resources/assets/app_image.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = Get.put(SplashServices());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppColor.kbackGroundColor,
                const Color.fromARGB(255, 11, 64, 93)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.saifLogowhite,
                          width: 220,
                          height: 220,
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
