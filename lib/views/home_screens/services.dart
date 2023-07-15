import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/colors/app_colors.dart';
import '../../utils/services_grid.dart';
import '../../view_models/controller/service_controller/service_controller.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  Future<void> _loadData(bool reload) async {
    await Get.find<ServicesController>().getservices();
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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Services',
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
        body: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          edgeOffset: 10,
          displacement: 200,
          strokeWidth: 2,
          color: AppColor.kPrimaryColor,
          backgroundColor: AppColor.kWhiteColor,
          semanticsLabel: "Fetching services...",
          semanticsValue: "Fetching services...",
          onRefresh: () async {
            await _loadData(true);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * .03),
                GetBuilder<ServicesController>(
                  init: ServicesController(),
                  builder: (controller) {
                    return controller.isLoading == true
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: GridView.builder(
                                itemCount: controller.serviceListModel.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.2 / 1.1,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return serviceGrid(
                                    servicesName: controller
                                        .serviceListModel[index]["name"],
                                    iconPath: controller.serviceListModel[index]
                                        ["image"],
                                    serviceId: controller
                                        .serviceListModel[index]["id"]
                                        .toString(),
                                  );
                                },
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
