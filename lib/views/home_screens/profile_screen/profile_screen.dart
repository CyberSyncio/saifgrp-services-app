import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/app_url/app_url.dart';
import 'package:myapp/utils/routes/routes_name.dart';
import 'package:myapp/view_model/controller/update_profile_controller/update_profile_controller.dart';
import 'package:myapp/view_model/controller/user_session_controller/store_user_data.dart';
import 'package:myapp/views/home_screens/profile_screen/profile_screen_component/profile_form_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final StoreUserData sessionController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double screenHeight = MediaQuery.of(context).size.height;
    double desiredSizedBoxHeight = 210 * fem; // You can adjust this value
    return Scaffold(
      body: Container(
          height: double.infinity,
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
          child: SingleChildScrollView(
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
                Text(
                  'Update Profile ',
                  style: SafeGoogleFont(
                    'montserrat',
                    fontSize: 24 * ffem,
                    fontWeight: FontWeight.w800,
                    height: 1.2125 * ffem / fem,
                    color: const Color(0xff1f2c34),
                  ),
                ),
                const SizedBox(height: 50),
                GetBuilder<UpdateProfileController>(
                    init: UpdateProfileController(),
                    builder: (controller) {
                      return Form(
                        child: Column(
                          children: [
                            ProfileFormField(
                                controller:
                                    controller.firstNameController.value,
                                fem: fem,
                                ffem: ffem,
                                title: 'First Name',
                                hint: 'First Name',
                                icon: Icons.person),
                            ProfileFormField(
                                //  controller.lastNameFocusNode.value,
                                controller:
                                    controller.lastNameController.value,
                                fem: fem,
                                ffem: ffem,
                                title: 'Last Name',
                                hint: 'Last Name',
                                icon: Icons.person),
                            SizedBox(height: 10 * fem),
                            InkWell(
                              onTap: () async {
                                if (controller.loading.value) {
                                } else {
                                  await controller.updateProfileApi();
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 370 * fem,
                                height: 50 * fem,
                                decoration: BoxDecoration(
                                  color: const Color(0xff436eee),
                                  borderRadius:
                                      BorderRadius.circular(10 * fem),
                                ),
                                child: controller.loading.value
                                    ? const Center(
                                        child: SpinKitCircle(
                                            size: 24, color: Colors.white))
                                    : Text(
                                        'Update Profile',
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 18 * ffem,
                                          fontWeight: FontWeight.w800,
                                          height: 1.2175 * ffem / fem,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(height: 22 * fem),
                            Row(
                              children: [
                                const SizedBox(width: 28),
                                GestureDetector(
                                  onTap: () => Get.toNamed(
                                    RoutesName.changPasswordScreen,
                                  ),
                                  child: Text(
                                    'Change Password',
                                    style: SafeGoogleFont(
                                      'montserrat',
                                      fontSize: 18 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      color: const Color(0xff436eee),
                                    ),
                                  ),
                                ),
                                SizedBox(width: ffem * 200),
                                GestureDetector(
                                  onTap: () {
                                    sessionController.logout();
                                    Get.toNamed(
                                      RoutesName.authMainScreen,
                                    );
                                  },
                                  child: Text(
                                    'LogOut',
                                    style: SafeGoogleFont(
                                      'montserrat',
                                      fontSize: 18 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      color: const Color(0xff436eee),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),

                SizedBox(
                  height: MediaQuery.of(context).size.height*.205,
                ),
                InkWell(
                  onTap: () {
                    // Add your URL here
                    String url = AppUrl.cyberSyncUrl;
                    launch(url);
                  },
                  child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Powered by ",
                          style: SafeGoogleFont(
                            "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff1f2c34),
                          ),
                          children: [
                            TextSpan(
                                text: "Cyber Sync Technologies",
                                style: SafeGoogleFont(
                                  "Montserrat",
                                  fontSize: 13,
                                  color: const Color(0xff1f2c34),
                                )),
                          ])),
                ),



              ],
            ),
          )),

    );
  }
}
