import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/utils/app_url/app_url.dart';
import '../../utils/utils.dart';
import '../../view_model/controller/login controller/login_screen_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool pass = true;
  final _formKey = GlobalKey<FormState>();
  LoginController controller = Get.put(LoginController());

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
          margin: EdgeInsets.fromLTRB(20 * fem, 50 * fem, 10 * fem, 0 * fem),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Log In',
                  style: SafeGoogleFont(
                    'montserrat',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    height: 1.2125 * ffem / fem,
                    color: const Color(0xff1f2c34),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Welcome back! ',
                    style: SafeGoogleFont(
                      'montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: const Color(0xff646464),
                    ),
                  ),
                ),
                SizedBox(height: 50 * fem),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 60 * fem,
                        width: 384 * fem,
                        padding: const EdgeInsets.only(left: 7),
                        margin: const EdgeInsets.only(top: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10 * fem),
                          border: Border.all(color: const Color(0xffd3d1d9)),
                        ),
                        child: TextFormField(
                            controller: controller.emailController.value,
                            focusNode: controller.emailFocusNode.value,
                            keyboardType: TextInputType.emailAddress,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: const InputDecoration(
                                hintText: 'example@gmail.com',
                                prefixIcon: Icon(Icons.email_outlined),
                                border: InputBorder.none)),
                      ),
                      SizedBox(height: 20 * fem),
                      Container(
                        height: 60 * fem,
                        width: 384 * fem,
                        padding: const EdgeInsets.only(left: 7),
                        margin: const EdgeInsets.only(top: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10 * fem),
                          border: Border.all(color: const Color(0xffd3d1d9)),
                        ),
                        child: TextFormField(
                            controller: controller.passwordController.value,
                            focusNode: controller.passwordFocusNode.value,
                            obscureText: pass,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.key_outlined,
                                ),
                                hintText: 'password',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        pass = !pass;
                                      });
                                    },
                                    icon: Icon(pass
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye)),
                                border: InputBorder.none)),
                      ),
                      SizedBox(height: 30 * fem),
                      InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (controller
                                      .emailController.value.text.isEmpty &&
                                  controller
                                      .passwordController.value.text.isEmpty) {
                                Utils.snackBar('Error',
                                    'Field Must include "email" and "password',
                                    action: 'error');
                              } else {
                                controller.loginApi();
                              }
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 384 * fem,
                            height: 45 * fem,
                            decoration: BoxDecoration(
                              color: const Color(0xff436eee),
                              borderRadius: BorderRadius.circular(10 * fem),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x3f000000),
                                  offset: Offset(0 * fem, 4 * fem),
                                  blurRadius: 2 * fem,
                                ),
                              ],
                            ),
                            child: controller.loading.value
                                ? const Center(
                                    child: SpinKitCircle(
                                        size: 24, color: Colors.white))
                                : Text(
                                    'Login',
                                    style: SafeGoogleFont(
                                      'montserrat',
                                      fontSize: 18 * ffem,
                                      fontWeight: FontWeight.w800,
                                      height: 1.2125 * ffem / fem,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                          )),
                      SizedBox(height: 20 * fem),
                      SizedBox(
                        height: 20 * fem,
                        child: InkWell(
                          onTap: () {
                            // Add your URL here
                            String url = AppUrl.resetWebUrl;
                          },
                          child: Text(
                            'Forgot password?',
                            style: SafeGoogleFont(
                              'montserrat',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w500,
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
        ),
      ),
    );
  }
}
