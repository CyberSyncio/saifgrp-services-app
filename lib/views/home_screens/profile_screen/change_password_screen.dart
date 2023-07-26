import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view_model/controller/change_password_controller/change_password_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../utils/utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool pass = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool pass = true;
    bool cpass = true;
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(
                      context,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    width: 100 * fem,
                  ),
                  Text(
                    'Change Password ',
                    style: SafeGoogleFont(
                      'montserrat',
                      fontSize: 24 * ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.2125 * ffem / fem,
                      color: const Color(0xff1f2c34),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              GetBuilder<ChangePasswordController>(
                  init: ChangePasswordController(),
                  builder: (controller) {
                    return Form(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 60 * fem,
                              width: 384 * fem,
                              padding: const EdgeInsets.only(left: 7),
                              margin: const EdgeInsets.only(top: 7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10 * fem),
                                border:
                                    Border.all(color: const Color(0xffd3d1d9)),
                              ),
                              child: TextFormField(
                                controller: controller.passwordController.value,
                                obscureText: pass,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.key_outlined,
                                  ),
                                  hintText: 'password',
                                  // suffixIcon: IconButton(
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       pass = !pass;
                                  //     });
                                  //   },
                                  //   icon: Icon(pass
                                  //       ? Icons.remove_red_eye_outlined
                                  //       : Icons.remove_red_eye),
                                  // ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 10 * fem),
                            Container(
                                height: 60 * fem,
                                width: 384 * fem,
                                padding: const EdgeInsets.only(left: 7),
                                margin: const EdgeInsets.only(top: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10 * fem),
                                  border: Border.all(
                                      color: const Color(0xffd3d1d9)),
                                ),
                                child: TextFormField(
                                    controller: controller
                                        .confirmPasswordController.value,
                                    obscureText: pass,
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.key_outlined,
                                        ),
                                        hintText: 'password',
                                        // suffixIcon: IconButton(
                                        //   onPressed: () {
                                        //     setState(() {
                                        //       pass =
                                        //           !pass; // Toggle password visibility
                                        //     });
                                        //   },
                                        //   icon: Icon(pass
                                        //       ? Icons.remove_red_eye_outlined
                                        //       : Icons.remove_red_eye),
                                        // ),
                                        border: InputBorder.none))),
                            SizedBox(height: 30 * fem),
                            InkWell(
                              onTap: () {
                                if (controller.loading.value) {
                                } else {
                                  controller.changePasswordApi();
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 370 * fem,
                                height: 50 * fem,
                                decoration: BoxDecoration(
                                  color: const Color(0xff436eee),
                                  borderRadius: BorderRadius.circular(10 * fem),
                                ),
                                child: controller.loading.value
                                    ? const Center(
                                        child: SpinKitCircle(
                                            size: 24, color: Colors.white))
                                    : Text(
                                        'Change Password',
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
                          ],
                        ),
                      ),
                    );
                  })
            ],
          )),
    );
  }
}
