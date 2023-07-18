import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/colors/app_colors.dart';
import '../../utils/services_grid.dart';
import '../../view_models/controller/service_controller/service_controller.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  var value = Get.arguments ?? false;

  @override
  void initState() {
    Get.put(ServicesController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: value == true
            ? AppBar(
                title: const Text('Services'),
              )
            : null,
        body: GetBuilder<ServicesController>(
            init: ServicesController(),
            builder: (controller) {
              return RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                edgeOffset: 10,
                displacement: 200,
                strokeWidth: 2,
                color: AppColor.kPrimaryColor,
                backgroundColor: AppColor.kWhiteColor,
                semanticsLabel: "Fetching services...",
                semanticsValue: "Fetching services...",
                onRefresh: () => controller.getservices(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Adding some Section

                      SizedBox(height: height * .03),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                servicesName: controller.serviceListModel[index]
                                    ["name"],
                                iconPath: controller.serviceListModel[index]
                                    ["image"],
                                serviceId: controller.serviceListModel[index]
                                        ["id"]
                                    .toString(),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
