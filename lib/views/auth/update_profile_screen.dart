import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/resources/routes/routes_name.dart';
import 'package:saif_app/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saif_app/view_models/controller/update_profile_controller/update_profile_controller.dart';
import 'dart:io';
import '../../resources/assets/app_image.dart';
// import '../../view_models/controller/login controller/login_view_model.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  UpdateProfileController updateprofileController =
      Get.put(UpdateProfileController());
  final _formKey = GlobalKey<FormState>();
  File? image;
  @override
  void initState() {
    UpdateProfileController updateprofileController =
        Get.put(UpdateProfileController());
    super.initState();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.toNamed(RoutesName.homeScreen),
            icon: const Icon(
              Icons.arrow_back,
            ),
            color: Colors.white,
          ),
          title: Text(
            'Profile',
            style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: AppColor.kWhiteColor),
          ),
          centerTitle: true,
          backgroundColor: AppColor.kbackGroundColor,
        ),
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .05,
                ),
                SizedBox(
                  height: height * .16,
                  width: width * .4,
                  child: Stack(children: [
                    Positioned(
                      top: 0,
                      left: 5,
                      child: SizedBox(
                        height: height * .16,
                        width: width * .35,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 167, 209, 231),
                          child: Image.asset(
                            AppImages.avater2,
                            height: height * .12,
                            width: width * .26,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 70,
                        left: 110,
                        child: InkWell(
                          onTap: () => pickImage(),
                          child: Icon(
                            Icons.edit,
                            color: AppColor.kbackGroundColor,
                            size: 40,
                          ),
                        ))
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .05,
                ),
                GetBuilder<UpdateProfileController>(
                  init: UpdateProfileController(),
                  builder: (controller) {
                    return Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: TextFormField(
                                style:
                                    GoogleFonts.montserrat(color: Colors.black),
                                focusNode: controller.userNameFocusNode.value,
                                controller: controller.userNameController.value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    Utils.snackBar(
                                        "Username", "Enter Username");
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined,
                                      color: AppColor.kbackGroundColor),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: AppColor.kbackGroundColor)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: "User Name",
                                  hintStyle: GoogleFonts.montserrat(
                                      color: AppColor.blackColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: AppColor.kbackGroundColor),
                                  ),
                                  filled: false,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //TODO Login password
                            TextFormField(
                              style: GoogleFonts.montserrat(
                                  color: AppColor.blackColor),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  Utils.snackBar("Password", "Enter password");
                                }
                                return null;
                              },
                              focusNode: controller.firstNameFocusNode.value,
                              controller: controller.firstNameController.value,

                              // obscuringCharacter: "*",
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock,
                                    color: AppColor.kbackGroundColor),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: AppColor.kbackGroundColor)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: "First Name",
                                hintStyle: GoogleFonts.montserrat(
                                    color: AppColor.blackColor),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: AppColor.kbackGroundColor),
                                ),
                                filled: false,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  Utils.snackBar("Password", "Enter password");
                                }
                                return null;
                              },
                              focusNode: controller.lastNameFocusNode.value,
                              controller: controller.lastNameController.value,

                              style: GoogleFonts.montserrat(
                                  color: AppColor.blackColor),
                              // obscuringCharacter: "*",
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock,
                                    color: AppColor.kbackGroundColor),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: AppColor.kbackGroundColor)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: " Last Name",
                                hintStyle: GoogleFonts.montserrat(
                                    color: AppColor.blackColor),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: AppColor.kbackGroundColor),
                                ),
                                filled: false,
                              ),
                            ),

                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * .02,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ));
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => CustomButton(
                    title: "Update Profile",
                    textStyle: GoogleFonts.montserrat(
                      fontSize: 20.0,
                      color: AppColor.kWhiteColor,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                    onPressed: updateprofileController.loading.value
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              updateprofileController.updateProfileApi();
                            } else {
                              Utils.snackBar('Update Profile',
                                  'Kindly Enter Email And password');
                            }
                          },
                    // isLoading: loginController.loading.value,
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
