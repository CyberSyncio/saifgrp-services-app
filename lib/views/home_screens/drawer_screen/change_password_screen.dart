import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../resources/colors/app_colors.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/change_password_controller/change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Update Password',
            style: GoogleFonts.firaSans(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child:
                  const Icon(Icons.arrow_back, size: 30, color: Colors.white)),
          centerTitle: true,
          backgroundColor: AppColor.kbackGroundColor,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // SizedBox(
                  //   height: MediaQuery.sizeOf(context).height * .03,
                  // ),
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height * .2,
                      child: Lottie.asset(
                        'assets/images/update_password.json',
                        width: 170,
                        height: MediaQuery.sizeOf(context).height * .3,
                      )),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .05,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .9,
                    child: TextFormField(
                      controller: changePasswordController
                          .currentpasswordController.value,
                      focusNode: changePasswordController
                          .currentpasswordFocusNode.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.security_outlined,
                            color: AppColor.kbackGroundColor),
                        hintText: 'Current password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColor.kbackGroundColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColor.kbackGroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .02,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .9,
                    child: TextFormField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller:
                          changePasswordController.passwordController.value,
                      focusNode:
                          changePasswordController.passwordFocusNode.value,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.key, color: AppColor.kbackGroundColor),
                        hintText: 'New Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColor.kbackGroundColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColor.kbackGroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .02,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .9,
                    child: TextFormField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller: changePasswordController
                          .confirmPasswordController.value,
                      focusNode: changePasswordController
                          .confirmPasswordFocusNode.value,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.key, color: AppColor.kbackGroundColor),
                        hintText: 'Confirm Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColor.kbackGroundColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColor.kbackGroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  Obx(
                    () => CustomButton(
                      title: "Submit",
                      textStyle: GoogleFonts.firaSans(
                        fontSize: 20.0,
                        color: AppColor.kWhiteColor,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                      onPressed: changePasswordController.loading.value
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                changePasswordController.changePasswordApi();
                              }
                            },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
