import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/view_models/controller/request_controller/request_history_controller.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          style: GoogleFonts.firaSans(
              fontWeight: FontWeight.w800,
              color: AppColor.whiteColor,
              letterSpacing: 1,
              fontSize: 20),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.kPrimaryColor,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: AppColor.kWhiteColor,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
          child: GetBuilder<RequestHistoryController>(
              init: RequestHistoryController(),
              builder: (controller) {
                return ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 2,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: const Icon(Icons.history),
                      title: Text(
                        "Muhammad shearz",
                        style: GoogleFonts.firaSans(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      subtitle:
                          const Text("I need a plumber for Marina tower "),
                      trailing: const Text("09-09-023"),
                      onTap: () {
                        // Handle item tap event
                      },
                    );
                  },
                );
              })),
    );
  }
}
