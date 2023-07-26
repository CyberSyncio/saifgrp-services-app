import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view_model/controller/register_screen_controller/register_screen_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool pass = true;
  bool cpass = true;
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
                  'Sign up',
                  style: SafeGoogleFont(
                    'montserrat',
                    fontSize: 25 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.2125 * ffem / fem,
                    color: const Color(0xff1f2c34),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Welcome! don't have an Account? ",
                    style: SafeGoogleFont(
                      'montserrat',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: const Color(0xff646464),
                    ),
                  ),
                ),
                SizedBox(height: 50 * fem),
                GetBuilder<RegisterController>(
                    init: RegisterController(),
                    builder: (controller) {
                      return Form(
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
                                  border: Border.all(
                                      color: const Color(0xffd3d1d9)),
                                ),
                                child: TextFormField(
                                    controller:
                                        controller.userNameController.value,
                                    focusNode:
                                        controller.userNameFocusNode.value,
                                    decoration: const InputDecoration(
                                        hintText: 'User Name',
                                        prefixIcon: Icon(Icons.person),
                                        border: InputBorder.none)),
                              ),
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
                                    controller:
                                        controller.emailController.value,
                                    focusNode: controller.emailFocusNode.value,
                                    decoration: const InputDecoration(
                                        hintText: 'abc@gmail.com',
                                        prefixIcon: Icon(Icons.email_outlined),
                                        border: InputBorder.none)),
                              ),
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
                                    controller:
                                        controller.passwordController.value,
                                    focusNode:
                                        controller.passwordFocusNode.value,
                                    obscureText: pass,
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
                                    focusNode: controller
                                        .confirmPasswordFocusNode.value,
                                    obscureText: pass,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.key_outlined,
                                        ),
                                        hintText: 'Confirm Passwod',
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                cpass = !cpass;
                                              });
                                            },
                                            icon: Icon(cpass
                                                ? Icons.remove_red_eye_outlined
                                                : Icons.remove_red_eye)),
                                        border: InputBorder.none)),
                              ),
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
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    isExpanded: true,
                                    elevation: 0,
                                    value: controller.dropDownValue.value,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_circle_outlined),
                                    iconEnabledColor: const Color(0xff436eee),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        controller.dropDownValue.value =
                                            newValue!;
                                      });
                                    },
                                    items: controller.buildingList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30 * fem),
                              InkWell(
                                onTap: () {
                                  if (controller.loading.value) {
                                  } else {
                                    controller.getBuildingId();
                                    controller.registerApi();
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 384 * fem,
                                  height: 45 * fem,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff436eee),
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
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
                                          'Register',
                                          style: SafeGoogleFont(
                                            'montserrat',
                                            fontSize: 18 * ffem,
                                            fontWeight: FontWeight.w800,
                                            height: 1.2125 * ffem / fem,
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
