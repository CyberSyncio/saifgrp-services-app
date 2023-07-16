import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/view_models/controller/request_controller/request_history_controller.dart';

class RequestHistoryScreen extends StatefulWidget {
  const RequestHistoryScreen({Key? key}) : super(key: key);

  @override
  State<RequestHistoryScreen> createState() => _RequestHistoryScreenState();
}

class _RequestHistoryScreenState extends State<RequestHistoryScreen> {
  Future<void> _loadData(bool reload) async {
    await Get.find<RequestHistoryController>()
        .getRequestHistory(reload: reload);
  }

  @override
  void initState() {
    _loadData(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Complaints',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: AppColor.kWhiteColor,
            ),
          ),
          backgroundColor: AppColor.kbackGroundColor,
          centerTitle: true,
        ),
        body: Container(
          color: AppColor.kWhiteColor,
          child: GetBuilder<RequestHistoryController>(
            init: RequestHistoryController(),
            builder: (controller) {
              return controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColor.kbackGroundColor,
                      ),
                    )
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
                      : RefreshIndicator(
                          onRefresh: () => _loadData(true),
                          child: ListView.builder(
                            itemCount: controller.requestList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Text(
                                        controller.requestList[index]['service']
                                            ['name'],
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Text(
                                        controller.requestList[index]
                                            ['description'],
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    trailing: const Icon(
                                      Icons.verified_outlined,
                                      color: Colors.black54,
                                      size: 29,
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    height: 1,
                                    thickness: 1,
                                  ),
                                ],
                              );
                            },
                          ),
                        );
            },
          ),
        ),
      ),
    );
  }
}
