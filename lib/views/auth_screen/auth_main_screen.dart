import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/view_model/controller/auth_controller/auth_controller.dart';
import 'package:myapp/views/auth_screen/register_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/app_url/app_url.dart';
import 'login_screen.dart';

class AuthMainScreen extends StatefulWidget {
  const AuthMainScreen({super.key});

  @override
  State<AuthMainScreen> createState() => _AuthMainScreenState();
}

class _AuthMainScreenState extends State<AuthMainScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    @override
    AuthMainScreenController authController =
        Get.put(AuthMainScreenController());

    tabController = TabController(
        initialIndex: authController.getIndex, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Container(
        // signindf7 (56:175)
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
              height: ffem * 200,
              padding: const EdgeInsets.only(top: 20),
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
            TabBar(
                unselectedLabelColor: Colors.black,
                labelStyle: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                labelColor: const Color(0xff436eee),
                controller: tabController,
                tabs: const [
                  Tab(
                    text: 'Login',
                  ),
                  Tab(text: 'Sign up'),
                ]),
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: const [LoginScreen(), RegisterScreen()]),
            ),




              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child:  InkWell(
                    onTap: () {
                      // Add your URL here
                      String url = AppUrl.privacyPolicy;
                      launch(url);
                    },

                    child: Text("Privacy policies")),
              ),
            SizedBox(height: MediaQuery.of(context).size.height*0.020,)
          ],
        ),
      ),
    ));
  }
}
// SizedBox(
//   height: MediaQuery.of(context).size.height*.205,
// ),
// InkWell(
//   onTap: () {
//     // Add your URL here
//     String url = AppUrl.cyberSyncUrl;
//     launch(url);
//   },
//   child: RichText(
//       softWrap: true,
//       textAlign: TextAlign.center,
//       text: TextSpan(
//           text: "Powered by ",
//           style: SafeGoogleFont(
//             "Montserrat",
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: const Color(0xff1f2c34),
//           ),
//           children: [
//             TextSpan(
//                 text: "Cyber Sync Technologies",
//                 style: SafeGoogleFont(
//                   "Montserrat",
//                   fontSize: 13,
//                   color: const Color(0xff1f2c34),
//                 )),
//           ])),
// ),