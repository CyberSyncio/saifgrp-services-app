import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view_model/controller/splash_screen_controller/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenController _splashScreenController =
      Get.put(SplashScreenController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // splashscreenA89 (37:360)
        padding:
            EdgeInsets.fromLTRB(81 * fem, 322 * fem, 80.06 * fem, 323.07 * fem),
        width: double.infinity,
        height: 913 * fem,
        decoration: BoxDecoration(
          color: const Color(0xff436eee),
          border: Border.all(color: const Color(0x7f000000)),
          boxShadow: [
            BoxShadow(
              color: const Color(0x3f000000),
              offset: Offset(0 * fem, 4 * fem),
              blurRadius: 2 * fem,
            ),
          ],
        ),
        child: Center(
          // e8875059a0419599e9a2554d3ed0e9 (33:362)
          child: SizedBox(
            width: 266.94 * fem,
            height: 267.93 * fem,
            child: Image.asset(
              'assets/page-1/images/e88750-59a0-4195-99e9-a2554d3ed0e9-removebg-preview-1-Kjw.png',
            ),
          ),
        ),
      ),
    );
  }
}
