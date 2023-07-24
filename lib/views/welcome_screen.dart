import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view_model/controller/auth_controller/auth_controller.dart';

import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final AuthMainScreenController _authController =
      Get.put(AuthMainScreenController());
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: double.infinity,
        child: Container(
          // mainscreen2Ju (1:24)
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0x7f000000)),
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x3f000000),
                offset: Offset(0 * fem, 4 * fem),
                blurRadius: 2 * fem,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: ffem * 120,
                decoration: const BoxDecoration(
                  color: Color(0xff436eee),
                ),
                child: SizedBox(
                  height: 137,
                  width: 159,
                  child: Image.asset(
                      'assets/page-1/images/e88750-59a0-4195-99e9-a2554d3ed0e9-removebg-preview-1-RSR.png'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 388 * fem,
                height: 370 * fem,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(56 * fem),
                  child: Image.asset(
                    'assets/page-1/images/plumber-1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 30 * fem),
              Text(
                'All your Services in one App',
                textAlign: TextAlign.justify,
                style: SafeGoogleFont(
                  'montserrat',
                  fontSize: 28 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.2125 * ffem / fem,
                  color: const Color(0xff1f2c34),
                ),
              ),
              SizedBox(height: 120 * fem),
              SizedBox(
                height: 60 * fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        _authController.setIndex(0);
                        Get.toNamed(RoutesName.authMainScreen);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        // primarybuttonHYu (1:30)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 14.52 * fem, 0 * fem),
                        width: 175.24 * fem,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xff436eee),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Log In',
                            style: SafeGoogleFont(
                              'montserrat',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _authController.setIndex(1);
                        Get.toNamed(RoutesName.authMainScreen);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 172.24 * fem,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x3f000000),
                              offset: Offset(0 * fem, 0 * fem),
                              blurRadius: 3 * fem,
                            ),
                          ],
                        ),
                        child: Text(
                          'Sign Up',
                          style: SafeGoogleFont(
                            'montserrat',
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xff436eee),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
