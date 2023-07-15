import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:saif_app/view_models/controller/forget_password_controller/forget_password_controller.dart';
import '../../resources/colors/app_colors.dart';
import '../../utils/utils.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Forget Password',
            style: GoogleFonts.firaSans(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColor.kPrimaryColor,
          elevation: 0.0,
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child:
                  const Icon(Icons.arrow_back, size: 30, color: Colors.white)),
        ),
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .02,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .2,
                    child: Lottie.asset(
                      'assets/images/data.json',
                      height: MediaQuery.sizeOf(context).height * .02,
                      width: 180,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      "Have you forget your Password don't worry just entered your email you have registered with.",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.firaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.9),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller:
                          forgetPasswordController.emailController.value,
                      focusNode: forgetPasswordController.emailFocusNode.value,
                      decoration: InputDecoration(
                        hintText: 'Enter Email address',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColor.kPrimaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColor.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .05,
                  ),
                  Obx(
                    () => CustomButton(
                        title: "Submit",
                        textStyle: GoogleFonts.firaSans(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                        onPressed: forgetPasswordController.loading.value
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  forgetPasswordController.forgetPasswordApi();
                                }
                              }),
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
