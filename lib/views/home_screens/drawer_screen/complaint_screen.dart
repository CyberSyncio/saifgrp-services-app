import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/view_models/controller/request_controller/request_history_controller.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Your Complains',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: AppColor.kWhiteColor),
              ),
              backgroundColor: AppColor.kbackGroundColor,
              // shadowColor: Colors.grey.withOpacity(0.5),
              centerTitle: true,
            ),
            body: Container(
              color: AppColor.kWhiteColor,
              child: GetBuilder<RequestHistoryController>(
                init: RequestHistoryController(),
                builder: ((controller) {
                  return controller.isLoading == true
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
                          : ListView.builder(
                              itemCount: controller.requestList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          controller.requestList[index]
                                              ['service']['name'],
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
                                      thickness: 1
                                    ),
                                  ],
                                );
                              },
                            );
                }),
              ),
            )));
  }
}

// class MyData {
//   final Color color;
//   final String title;
//   final String description;
//   final String status;
//   final String date;

//   MyData({
//     required this.color,
//     required this.title,
//     required this.description,
//     required this.status,
//     required this.date,
//   });
// }
