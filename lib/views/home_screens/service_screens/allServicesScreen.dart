// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view_model/controller/all_services_controller/all_services_controller.dart';
import 'package:myapp/views/home_screens/service_screens/service_screen_component/service_screen_container.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../utils/utils.dart';

class AllServicesScreen extends StatelessWidget {
  AllServicesScreen({super.key});
  var arg = Get.arguments ?? 0;

  @override
  Widget build(BuildContext context) {
    var serviceController = Get.put(AllServicesController());
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
            onRefresh: () => serviceController.getServices(),
            child: SizedBox(
              width: double.infinity,
              child: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      mainAxisAlignment: arg == 1
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: [
                        arg == 1
                            ? InkWell(
                                onTap: () => Navigator.pop(
                                  context,
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 40,
                                ),
                              )
                            : const SizedBox.shrink(),
                        arg == 1
                            ? SizedBox(
                                width: 100 * fem,
                              )
                            : const SizedBox.shrink(),
                        Text(
                          'Services ',
                          style: SafeGoogleFont(
                            'montserrat',
                            fontSize: 24 * ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xff1f2c34),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: GetBuilder<AllServicesController>(
                          init: AllServicesController(),
                          builder: (controller) {
                            return controller.isLoading.value
                                ? const Center(
                                    child: SpinKitCubeGrid(
                                      color: Color(0xff436eee),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount:
                                        controller.serviceListModel.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return serviceScreenContainer(
                                        fem: fem,
                                        ffem: ffem,
                                        serviceId: controller
                                            .serviceListModel[index]['id'],
                                        img: controller.serviceListModel[index]
                                            ['image'],
                                        title: controller
                                            .serviceListModel[index]['name'],
                                        subtitle:
                                            controller.serviceListModel[index]
                                                ['description'],
                                      );
                                    },
                                  );
                          }),
                    )
                  ],
                ),
              ),
            )));
  }
}
