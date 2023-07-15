import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/resources/routes/routes_name.dart';
import 'package:saif_app/utils/utils.dart';

import '../../view_models/controller/login controller/login_screen_controller.dart';

class Login extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Lottie.asset(
                    'assets/images/login.json',
                    width: 170,
                    height: MediaQuery.of(context).size.height * .3,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Text('Welcome Back!',
                    style: GoogleFonts.firaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                        color: AppColor.kPrimaryColor)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          focusNode: loginController.emailFocusNode.value,
                          controller: loginController.emailController.value,
                          validator: (value) {
                            if (value!.isEmpty) {}
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            Utils.feildFocusChange(
                              context,
                              loginController.emailFocusNode.value,
                              loginController.passwordFocusNode.value,
                            );
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined,
                                color: AppColor.kPrimaryColor),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: AppColor.kPrimaryColor)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Email",
                            hintStyle: GoogleFonts.montserrat(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: AppColor.kPrimaryColor),
                            ),
                            filled: false,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {}
                            return null;
                          },
                          focusNode: loginController.passwordFocusNode.value,
                          controller: loginController.passwordController.value,
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.lock, color: AppColor.kPrimaryColor),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: AppColor.kPrimaryColor)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Password",
                            hintStyle: GoogleFonts.firaSans(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: AppColor.kPrimaryColor),
                            ),
                            filled: false,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .012,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 180,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 250),
                  child: InkWell(
                    onTap: () => Get.toNamed(RoutesName.forgetPasswordScreen),
                    child: Text(
                      'Forget Password?',
                      style: GoogleFonts.firaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .012,
                ),
                Obx(
                  () => CustomButton(
                    title: "Login",
                    textStyle: GoogleFonts.montserrat(
                      fontSize: 20.0,
                      color: AppColor.kWhiteColor,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                    onPressed: loginController.loading.value
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              loginController
                                          .emailController.value.text.isEmpty ||
                                      loginController
                                          .passwordController.value.text.isEmpty
                                  ? Utils.snackBar('Login',
                                      "email and password is required to login")
                                  : loginController.loginApi();
                            }
                          },
                    // isLoading: loginController.loading.value,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.firaSans(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.registerScreen);
                      },
                      child: Text(
                        "Register Here",
                        style: GoogleFonts.firaSans(
                            fontSize: 17,
                            color: AppColor.kbackGroundColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .02,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
