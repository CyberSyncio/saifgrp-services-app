import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/colors/app_colors.dart';
import '../../utils/services_grid.dart';
import '../../view_models/controller/service_controller/service_controller.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  var argumentsData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Services',
            style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: AppColor.kWhiteColor),
          ),
          centerTitle: true,
          backgroundColor: AppColor.kbackGroundColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
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
                            child: GridView.builder(
                                // physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                itemCount: controller.serviceListModel.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  // childAspectRatio: 1 / 1.3,
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
                                }));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
