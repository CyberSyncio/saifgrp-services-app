import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/resources/routes/routes_name.dart';
import 'package:saif_app/utils/utils.dart';
import '../../view_models/controller/register_screen_controller/register_screen_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterController registerController = Get.put(RegisterController());
  String dropDownValue = "select your Residential";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .06,
                ),
                SizedBox(
                    height: MediaQuery.sizeOf(context).height * .2,
                    child: Lottie.asset(
                      'assets/images/login.json',
                      width: 170,
                      height: MediaQuery.sizeOf(context).height * .2,
                    )),
                const SizedBox(height: 12),
                Text('Create New Account',
                    style: GoogleFonts.firaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                        color: AppColor.kPrimaryColor)),
                const SizedBox(height: 20),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          focusNode: registerController.emailFocusNode.value,
                          controller: registerController.emailController.value,
                          validator: (value) {
                            if (value!.isEmpty) {}
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            Utils.feildFocusChange(
                              context,
                              registerController.emailFocusNode.value,
                              registerController.passwordFocusNode.value,
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
                            hintStyle: GoogleFonts.firaSans(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: AppColor.kPrimaryColor),
                            ),
                            filled: false,
                          ),
                        ),
                        const SizedBox(height: 12),
                        //TODO Login password
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {}
                            return null;
                          },
                          focusNode: registerController.passwordFocusNode.value,
                          controller:
                              registerController.passwordController.value,
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
                        const SizedBox(height: 12),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {}
                            return null;
                          },
                          focusNode:
                              registerController.confirmPasswordFocusNode.value,
                          controller: registerController
                              .confirmPasswordController.value,
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
                            hintText: "Confirm Password",
                            hintStyle: GoogleFonts.firaSans(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: AppColor.kPrimaryColor),
                            ),
                            filled: false,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: MediaQuery.sizeOf(context).height * .065,
                          width: MediaQuery.sizeOf(context).width * .9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: AppColor.kbackGroundColor)),
                          child: DropdownButton<String>(
                            value: registerController.dropDownValue.value,
                            icon: Icon(Icons.arrow_drop_down_circle,
                                color: AppColor.kbackGroundColor),
                            iconSize: 24,
                            elevation: 0,
                            underline: const SizedBox.shrink(),
                            isExpanded: true,
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            dropdownColor: AppColor.kWhiteColor,
                            focusColor: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                            onChanged: (String? newValue) {
                              setState(() {
                                registerController.dropDownValue.value =
                                    newValue!;
                                registerController.getBuildingId();
                              });
                            },
                            items: registerController.buildingList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    )),

                const SizedBox(height: 12),

                Obx(
                  () => CustomButton(
                    title: "Register",
                    textStyle: GoogleFonts.firaSans(
                      fontSize: 20.0,
                      color: AppColor.kWhiteColor,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                    onPressed: registerController.loading.value
                        ? null
                        : () {
                            registerController.getBuildingId();
                            if (_formKey.currentState!.validate()) {
                              registerController
                                          .emailController.value.text.isEmpty ||
                                      registerController.passwordController
                                          .value.text.isEmpty ||
                                      registerController
                                          .confirmPasswordController
                                          .value
                                          .text
                                          .isEmpty ||
                                      registerController
                                          .buildingId.value.isEmpty
                                  ? Utils.snackBar(
                                      "Missing", "Kindly fill all the fields",
                                      action: "error")
                                  : registerController.registerApi();
                            }
                          },
                  ),
                ),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .012,
                ),

                //TODO sign up text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account?  ",
                      style: GoogleFonts.firaSans(
                          fontSize: 13.0, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.loginScreen);
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.firaSans(
                            fontSize: 17,
                            color: AppColor.kPrimaryColor,
                            decoration: TextDecoration.underline,
                            letterSpacing: 1,
                            decorationColor: AppColor.kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .02,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
