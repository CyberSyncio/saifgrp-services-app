import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/colors/app_colors.dart';

// ......................FOCUS CHANGE..............................
class Utils {
  static void feildFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

// ......................TOAST..............................

  static getSnackBarColor({String? action}) {
    var backgroundColor = AppColor.blackColor;

    if (action == "success") {
      backgroundColor = Colors.green;
    } else if (action == "error") {
      backgroundColor = Colors.redAccent;
    } else if (action == "warning") {
      backgroundColor = Colors.yellowAccent;
    } else if (action == "info") {
      backgroundColor = AppColor.kPrimaryColor;
    } else if (action == "debug") {
      backgroundColor = Colors.black54;
    } else {
      backgroundColor = Colors.grey;
    }

    return backgroundColor;
  }

  static snackBar(String newtitle, String newmessage, {String? action}) {
    var backgroundColor = getSnackBarColor(action: action);
    Get.snackbar(newtitle, newmessage,
        colorText: Colors.white,
        backgroundColor: backgroundColor,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));
  }
}

// ......................CUSTOM BUTTON..............................
class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final TextStyle textStyle;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.textStyle = const TextStyle(
      fontSize: 18.0,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .06,
      width: MediaQuery.sizeOf(context).width * .9,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              AppColor.kbackGroundColor, // Background color of the button
          foregroundColor: Colors.white, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          elevation: 0, // Shadow elevation
          textStyle: GoogleFonts.montserrat(
            fontSize: 20.0,
            color: AppColor.kWhiteColor,
            fontWeight: FontWeight.w800,
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 10), // Button padding
        ),
        child: Text(title),
      ),
    );
  }
}

// ......................CUSTOM BUTTON..............................
class RequestButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const RequestButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .06,
      width: MediaQuery.sizeOf(context).width * .9,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              AppColor.kbackGroundColor, // Background color of the button
          foregroundColor: Colors.white, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          elevation: 0, // Shadow elevation
          textStyle: GoogleFonts.montserrat(
            fontSize: 20.0,
            color: AppColor.kWhiteColor,
            fontWeight: FontWeight.w800,
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 10), // Button padding
        ),
        child: Text(title),
      ),
    );
  }
}

const textStyle1 = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
const textStyle2 = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
const textStyle3 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
const textStyle4 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);
const textStyle5 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
const textStyle6 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);
const textStyle7 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
const textStyle8 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);
//
const textStyle9 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.grey,
);
