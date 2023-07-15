// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/colors/app_colors.dart';
import 'package:saif_app/resources/routes/routes_name.dart';

Widget serviceGrid({
  required String iconPath,
  required String servicesName,
  required String serviceId,
}) {
  return GestureDetector(
    onLongPress: () {
      // Handle long press event here
    },
    onTap: () =>
        Get.toNamed(RoutesName.reqdashboardScreen, arguments: serviceId),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: AppColor.kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: Image.network(
              iconPath,
              height: 50,
            ),
          ),
          const SizedBox(height: 15),
          // smart device name + switch
          Text(
            servicesName,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
