import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view_model/controller/all_services_controller/all_services_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/view_model/controller/building_controller/building_controller.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../../view_model/controller/internet_connectivity_controller/internet_connectivity_controller.dart';
import 'home_screen_component/residental_container.dart';
import 'home_screen_component/service_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    InternetConnectivityController internetController =
        Get.put(InternetConnectivityController());
    var buildController = Get.put(BuildingController());
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        edgeOffset: 10,
        displacement: 200,
        strokeWidth: 2,
        color: const Color.fromARGB(255, 106, 110, 121),
        backgroundColor: Colors.white,
        semanticsLabel: "Fetching services...",
        semanticsValue: "Fetching services...",
        onRefresh: () => buildController.homeScreenRefresher(),
        child: Obx(() {
          bool hasConnection = internetController.connectivityResult.value !=
              ConnectivityResult.none;
          return hasConnection
              ? Container(
                  height: MediaQuery.sizeOf(context).height * 1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0x7f000000)),
                    color: const Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x3f000000),
                        offset: Offset(0 * fem, 4 * fem),
                        blurRadius: 2 * fem,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: ffem * 200,
                        padding: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                          color: Color(0xff436eee),
                        ),
                        child: SizedBox(
                          height: 137,
                          width: 159,
                          child: Image.asset(
                              'assets/page-1/images/e88750-59a0-4195-99e9-a2554d3ed0e9-removebg-preview-1-RSR.png'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            'Services',
                            style: SafeGoogleFont(
                              'montserrat',
                              fontSize: 24 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: const Color(0xff1f2c34),
                            ),
                          ),
                          SizedBox(width: ffem * 265),
                          GestureDetector(
                            onTap: () => Get.toNamed(RoutesName.serviceScreen,
                                arguments: 1),
                            child: Text(
                              'View All',
                              style: SafeGoogleFont(
                                'montserrat',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125 * ffem / fem,
                                color: const Color(0xff436eee),
                              ),
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<AllServicesController>(
                          init: AllServicesController(),
                          builder: (controller) {
                            return Container(
                              // frame239cM (37:737)
                              margin: EdgeInsets.fromLTRB(
                                  10 * fem, 10 * fem, 18 * fem, 24 * fem),
                              width: double.infinity,
                              height: 100 * fem,
                              child: controller.isLoading.value
                                  ? const Center(
                                      child: SpinKitCubeGrid(
                                      color: Color(0xff436eee),
                                    ))
                                  : controller.serviceListModel.isEmpty
                                      ? const Center(
                                          child:
                                              Text('No internet connection '),
                                        )
                                      : ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller
                                              .serviceListModel.length,
                                          separatorBuilder: (context, index) =>
                                              SizedBox(width: 20 * fem),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return serviceContainer(
                                                fem: fem,
                                                ffem: ffem,
                                                serviceId: controller
                                                        .serviceListModel[index]
                                                    ['id'],
                                                img: controller
                                                        .serviceListModel[index]
                                                    ['image'],
                                                name: controller
                                                        .serviceListModel[index]
                                                    ['name']);
                                          },
                                        ),
                            );
                          }),
                      const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Projects',
                          style: SafeGoogleFont(
                            'montserrat',
                            fontSize: 24 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xff1f2c34),
                          ),
                        ),
                      ),
                      SizedBox(width: ffem * 230),
                      SizedBox(height: fem * 10),
                      Expanded(
                        child: GetBuilder<BuildingController>(
                            init: BuildingController(),
                            builder: (controller) {
                              return controller.isLoading.value
                                  ? const Center(
                                      child: SpinKitCubeGrid(
                                          color: Color(0xff436eee)))
                                  : controller.buildingModel.isEmpty
                                      ? const Center(
                                          child:
                                              Text('No internet connection '),
                                        )
                                      : GridView.builder(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, bottom: 80),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 20,
                                            crossAxisSpacing: 15,
                                            childAspectRatio: .75,
                                          ),
                                          itemCount:
                                              controller.buildingModel.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return residentalContainer(
                                                fem: fem,
                                                ffem: ffem,
                                                img: controller
                                                        .buildingModel[index]
                                                    ['image'],
                                                name: controller
                                                        .buildingModel[index]
                                                    ['name'],
                                                location: controller
                                                        .buildingModel[index]
                                                    ['city']);
                                          },
                                        );
                            }),
                      ),
                    ],
                  ),
                )
              // Your main content widget when there is internet
              : const Center(
                  child: Text(
                      "No internet connection ")); // Text shown when there is no internet
        }),
      ),
    );
  }
}
