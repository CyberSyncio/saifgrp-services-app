// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/assets/app_image.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/view_models/controller/store%20user%20session/store_user_data.dart';
import 'package:saif_app/views/home_screens/resedent.dart';

import '../../resources/routes/routes_name.dart';
import '../../view_models/controller/building_controller/building_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          backgroundColor: AppColor.kWhiteColor,
          shadowColor: AppColor.kbackGroundColor,
          surfaceTintColor: AppColor.blackColor,
          child: sliderView(context),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Builder(builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  height: 60,
                  width: MediaQuery.sizeOf(context).width * 1,
                  color: AppColor.kbackGroundColor,
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: Row(
                      children: [
                        Image.asset(AppImages.icon, height: 35),
                        const SizedBox(width: 12),
                        Text(
                          "Saif Group",
                          style: GoogleFonts.montserrat(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),

            SizedBox(height: height * 0.020),

            Container(
              height: height * .18,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: getBorderRadiusWidget(context, 0.02),
                color: const Color.fromARGB(255, 45, 151, 209),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: Text(
                          "Welcome To Saif Group",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Higher Quality Of Living",
                          style: GoogleFonts.montserrat(
                            fontSize: 16.0,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(RoutesName.serviceScreen),
                        child: Container(
                          height: height * .045,
                          width: width * .5,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            "Services",
                            style: GoogleFonts.montserrat(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),

            // const Divider(),
            SizedBox(height: height * 0.033),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Appartments',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Center(
              child: GetBuilder<BuildingController>(
                  init: BuildingController(),
                  builder: (controller) {
                    return Container(
                      alignment: Alignment.center,
                      width:
                          controller.isLoading == true ? width * .2 : width * 1,
                      height: controller.isLoading == true
                          ? height * 0.2
                          : height * 0.45,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: controller.isLoading == true
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.buildingModel.length,
                              itemBuilder: (BuildContext context, int index) {
                                return HousesWidget(
                                  imageName: controller.buildingModel[index]
                                      ["image"],
                                  title1: controller.buildingModel[index]
                                      ['name'],
                                  title2: controller.buildingModel[index]
                                      ['description'],
                                  city: controller.buildingModel[index]["city"]
                                      .toString(),
                                );
                              },
                            ),
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget sliderView(BuildContext context) {
  final StoreUserData sessionController = Get.find();
  return Container(
    height: MediaQuery.of(context).size.height * 1,
    decoration: BoxDecoration(
      color: AppColor.whiteColor,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: MediaQuery.sizeOf(context).width * 1,
            color: AppColor.kbackGroundColor,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.16,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  AppImages.saifLogowhite,
                  width: MediaQuery.sizeOf(context).width *
                      0.1, // Adjust the width value as needed
                  height: MediaQuery.sizeOf(context).height *
                      0.12, // Adjust the height value as needed
                ),
              ),
            )),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),

        // Add some spacing between the profile section and the list items

        ListTile(
          leading:
              const Icon(Icons.person, size: 40, color: AppColor.blackColor),
          title: Text(
            "Profile",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: AppColor.blackColor,
            ),
          ),
          onTap: () => Get.toNamed(RoutesName.updateProfileScreen),
        ),
        const SizedBox(
          height: 5,
        ),

        ListTile(
          leading: const Icon(Icons.lock_outline,
              size: 40, color: AppColor.blackColor),
          title: Text(
            "Change Password",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: AppColor.blackColor,
            ),
          ),
          onTap: () {
            Get.toNamed(RoutesName.changePasswordScreen);
          },
        ),

        const SizedBox(
          height: 5,
        ),
        ListTile(
          leading: const Icon(Icons.logout_rounded,
              size: 40, color: AppColor.blackColor),
          title: Text(
            "Log Out",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: AppColor.blackColor,
            ),
          ),
          onTap: () {
            sessionController.logout();
            Get.toNamed(RoutesName.loginScreen);
          },
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * .495,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Version : 0.0.1',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: AppColor.blackColor,
            ),
          ),
        ),
      ],
    ),
  );
}
