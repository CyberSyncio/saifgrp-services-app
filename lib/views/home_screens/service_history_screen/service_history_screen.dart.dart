import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/views/home_screens/service_history_screen/service_history_component/service_history_container.dart';
import '../../../utils/utils.dart';
import '../../../view_model/controller/service_history_controller/service_history_controller.dart';
import 'package:intl/intl.dart';

class ServiceHistoryScreen extends StatelessWidget {
  const ServiceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SizedBox(
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
            Text(
              'User Services History ',
              style: SafeGoogleFont(
                'Inter',
                fontSize: 24 * ffem,
                fontWeight: FontWeight.w800,
                height: 1.2125 * ffem / fem,
                color: const Color(0xff1f2c34),
              ),
            ),
            SizedBox(height: 20 * fem),
            Expanded(
              child: GetBuilder<ServiceHistoryController>(
                  init: ServiceHistoryController(),
                  builder: (controller) {
                    return controller.isLoading.value
                        ? const Center(
                            child: SpinKitCubeGrid(color: Color(0xff436eee)))
                        : controller.requestList.isEmpty
                            ? Center(
                                child: Text(
                                  "You haven't filed any complaint",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: controller.requestList.length,
                                itemBuilder: (context, index) {
                                  return serviceHistoryScreenContainer(
                                    fem: fem,
                                    ffem: ffem,
                                    img: controller.requestList[index]
                                        ['service']['image'],
                                    title: controller.requestList[index]
                                        ['service']['name'],
                                    subtitle: DateFormat('dd-MM-yyyy').format(
                                        DateTime.parse(controller
                                            .requestList[index]['created_on'])),
                                    description: controller.requestList[index]
                                        ['description'],
                                  );
                                },
                              );
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
