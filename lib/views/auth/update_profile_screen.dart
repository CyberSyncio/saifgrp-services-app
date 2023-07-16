import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/resources/routes/routes_name.dart';
import 'package:saif_app/utils/utils.dart';
import 'package:saif_app/view_models/controller/update_profile_controller/update_profile_controller.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _loadDataa(bool reload) async {
    await Get.find<UpdateProfileController>().getUserDetailApi();
  }

  @override
  void initState() {
    super.initState();
    _loadDataa(true);
    updateProfileController;
  }

  @override
  Widget build(BuildContext context) {
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
              color: AppColor.kWhiteColor,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColor.kbackGroundColor,
        ),
        resizeToAvoidBottomInset: true,
        body: RefreshIndicator(
          edgeOffset: 10,
          displacement: 200,
          strokeWidth: 2,
          color: AppColor.kPrimaryColor,
          onRefresh: () async {
            await _loadDataa(true);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Lottie.asset(
                      'assets/images/login.json',
                      width: 170,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Update Profile',
                    style: GoogleFonts.firaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      color: AppColor.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                ),
                                focusNode: controller.userNameFocusNode.value,
                                controller: controller.userNameController.value,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: AppColor.kbackGroundColor,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: 'User Name',
                                  hintStyle: GoogleFonts.montserrat(
                                    color: AppColor.blackColor,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: AppColor.kbackGroundColor,
                                    ),
                                  ),
                                  filled: false,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              style: GoogleFonts.montserrat(
                                color: AppColor.blackColor,
                              ),
                              focusNode: controller.firstNameFocusNode.value,
                              controller: controller.firstNameController.value,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColor.kbackGroundColor,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'First Name',
                                hintStyle: GoogleFonts.montserrat(
                                  color: AppColor.blackColor,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColor.kbackGroundColor,
                                  ),
                                ),
                                filled: false,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              focusNode: controller.lastNameFocusNode.value,
                              controller: controller.lastNameController.value,
                              style: GoogleFonts.montserrat(
                                color: AppColor.blackColor,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColor.kbackGroundColor,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'Last Name',
                                hintStyle: GoogleFonts.montserrat(
                                  color: AppColor.blackColor,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColor.kbackGroundColor,
                                  ),
                                ),
                                filled: false,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => CustomButton(
                      title: 'Submit',
                      textStyle: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        color: AppColor.kWhiteColor,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                      onPressed: updateProfileController.loading.value
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                updateProfileController.updateProfileApi();
                              } else {
                                Utils.snackBar(
                                  'Missing',
                                  'Please fill all the fields',
                                  action: 'error',
                                );
                              }
                            },
                    ),
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
