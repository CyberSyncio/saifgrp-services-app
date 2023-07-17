import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/assets/app_image.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/view_models/controller/store%20user%20session/store_user_data.dart';
import 'package:saif_app/views/home_screens/resedent.dart';

import '../../resources/routes/routes_name.dart';
import '../../view_models/controller/building_controller/building_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _loadData(bool reload) async {
    await Get.find<BuildingController>().getBuilding();
  }

  @override
  void initState() {
    _loadData(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: AppColor.kWhiteColor,
        shadowColor: AppColor.kbackGroundColor,
        surfaceTintColor: AppColor.blackColor,
        child: sliderView(context),
      ),
      body: RefreshIndicator(
        edgeOffset: 10,
        displacement: 200,
        strokeWidth: 2,
        color: AppColor.kPrimaryColor,
        backgroundColor: AppColor.kWhiteColor,
        onRefresh: () => _loadData(true),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(builder: (context) {
                return Container(
                  // decoration: BoxDecoration(
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.5),
                  //       spreadRadius: 2,
                  //       blurRadius: 5,
                  //       offset: const Offset(0, 3),
                  //     ),
                  //   ],
                  // ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 60,
                    width: MediaQuery.of(context).size.width * 1,
                    color: AppColor.kPrimaryColor,
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: InkWell(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 11),
                            child: Text(
                              "Saif Group",
                              style: GoogleFonts.openSans(
                                fontSize: 19.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.menu,
                              size: 40,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
              // SizedBox(height: height * 0.020),
              Container(
                height: height * .17,
                // padding: const EdgeInsets.all(15),
                // margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColor.kPrimaryColor,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.3),
                  //     spreadRadius: 3,
                  //     blurRadius: 8,
                  //     offset: const Offset(0, 3),
                  //   ),
                  // ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(width: width * 0.025),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey Ikran Khan,",
                              // textAlign: TextAlign.justify,
                              style: GoogleFonts.openSans(
                                fontSize: 20.0,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.008,
                            ),
                            Text(
                              "Empowering Success through \nInnovation and Expertise",
                              style: GoogleFonts.montserrat(
                                fontSize: 16.0,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                // fontWeight: FontWeight.w800,
                                // letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    //   child: SizedBox(
                    //     height: 100,
                    //     width: 150,
                    //     child: Image.asset(AppImages.saifLogo),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.023),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Apartments',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: height * 0.023),
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
                  },
                ),
              ),
            ],
          ),
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
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            color: AppColor.kbackGroundColor,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  AppImages.saifLogowhite,
                  width: MediaQuery.of(context).size.width *
                      0.1, // Adjust the width value as needed
                  height: MediaQuery.of(context).size.height *
                      0.12, // Adjust the height value as needed
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
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
    ),
  );
}
