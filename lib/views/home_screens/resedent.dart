import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/routes/routes_name.dart';

import '../../resources/colors/app_colors.dart';

class HousesWidget extends StatelessWidget {
  const HousesWidget({
    Key? key,
    required this.imageName,
    required this.title1,
    required this.title2,
    required this.city,
  }) : super(key: key);

  final String imageName;
  final String title1;
  final String title2;
  final String city;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => Get.toNamed(RoutesName.serviceScreen),
      child: Padding(
        padding: EdgeInsets.only(right: width * 0.06),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageName,
                  width: width * 0.65,
                  height: height * 0.45,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: width * 0.65,
                  height: height * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColor.kbackGroundColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          // Use Expanded to make sure the Text widget takes available space.
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title1,
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                                overflow: TextOverflow.ellipsis, // Handles text overflow with an ellipsis.
                                maxLines: 1, // Set the number of lines you want to display (1 line in this case).
                              ),
                              Text(
                                title2,
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis, // Handles text overflow with an ellipsis.
                                maxLines: 1, // Set the number of lines you want to display (1 line in this case).
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.02,
                right: width * 0.03,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.008,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: getBorderRadiusWidget(context, 0.02),
                    color: Colors.white60,
                  ),
                  child: Text(
                    city,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
