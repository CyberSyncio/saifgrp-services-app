import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget residentGrid({
  required BuildContext context,
  required String servicesName,
  required String iconPath,
  required String location,
 
}) {
  var height = MediaQuery.sizeOf(context).height;
  var width = MediaQuery.sizeOf(context).width;
  return Container(
    height: height * .23,
    margin: const EdgeInsets.only(
      bottom: 10,
      left: 22,
      right: 22,
    ),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 6,
        offset: const Offset(3, 3),
        spreadRadius: 1,
      ),
    ], borderRadius: BorderRadius.circular(10), color: Colors.white

        //const Color.fromARGB(44, 7, 18, 103)
        ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // icon
        // SizedBox(width: width * .02),
        Image.asset(
          iconPath,
          height: height * .14,
          width: width * 1,
          fit: BoxFit.fill,
        ),
        const Divider(
          thickness: .5,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                servicesName,
                style: GoogleFonts.firaSans(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                location,
                style: GoogleFonts.firaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        )
        // SizedBox(height: height * .03),
        // InkWell(
        //   onTap: () => Get.toNamed(RoutesName.serviceScreen),
        //   child: Container(
        //     alignment: Alignment.center,
        //     margin: const EdgeInsets.only(left: 110),
        //     height: MediaQuery.of(context).size.height * .04,
        //     width: MediaQuery.sizeOf(context).width * .3,
        //     decoration: BoxDecoration(
        //       color: AppColor.kPrimaryColor,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: Text(
        //       'Select',
        //       style: GoogleFonts.firaSans(
        //         fontWeight: FontWeight.bold,
        //         fontSize: 20,
        //         color: AppColor.kWhiteColor,
        //       ),
        //     ),
        //   ),
        // )
        // smart device name + switch
        // SizedBox(height: height * .02)
      ],
    ),
  );
}
