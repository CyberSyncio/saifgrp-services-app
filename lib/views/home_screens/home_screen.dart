import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/resources/routes/routes_name.dart';

import 'package:saif_app/views/home_screens/resedent.dart';

import '../../view_models/controller/building_controller/building_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.put(BuildingController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<BuildingController>(
            init: BuildingController(),
            builder: (controller) {
              return RefreshIndicator(
                edgeOffset: 10,
                displacement: 200,
                strokeWidth: 2,
                color: AppColor.kPrimaryColor,
                backgroundColor: AppColor.kWhiteColor,
                onRefresh: () => controller.getBuilding(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.013,
                      ),
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
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 10),
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
                                  height: 0,
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
                                SizedBox(
                                  height: height * 0.035,
                                ),
                                GestureDetector(
                                  onTap: () => Get.toNamed(
                                      RoutesName.serviceScreen,
                                      arguments: true),
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
                      SizedBox(height: height * 0.033),
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
                      SizedBox(height: height * 0.02),
                      Center(
                        child: GetBuilder<BuildingController>(
                          init: BuildingController(),
                          builder: (controller) {
                            return Container(
                              alignment: Alignment.center,
                              width: controller.isLoading.value == true
                                  ? width * .2
                                  : width * 1,
                              height: controller.isLoading.value == true
                                  ? height * 0.2
                                  : height * 0.45,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: controller.isLoading.value == true
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          controller.buildingModel.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return HousesWidget(
                                          imageName: controller
                                              .buildingModel[index]["image"],
                                          title1: controller
                                              .buildingModel[index]['name'],
                                          title2:
                                              controller.buildingModel[index]
                                                  ['description'],
                                          city: controller.buildingModel[index]
                                                  ["city"]
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
              );
            }),
      ),
    );
  }
}
