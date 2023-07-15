// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/views/home_screens/drawer_screen/complaint_screen.dart';
import 'package:saif_app/views/home_screens/home_screen.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../view_models/controller/request_controller/request_history_controller.dart';
import '../home_screens/services.dart';
import '../../resources/assets/app_image.dart';
import '../../resources/colors/app_colors.dart';
import '../../resources/routes/routes_name.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen>
    with TickerProviderStateMixin {
  PersistentTabController? _controller;

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        textStyle: GoogleFonts.firaSans(
          fontSize: 16,
          // fontWeight: FontWeight.w600,
        ),
        icon: const Icon(
          Icons.home_outlined,
          size: 30,
        ),
        title: 'Residential',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: const Color.fromARGB(255, 167, 218, 245),
      ),
      PersistentBottomNavBarItem(
        textStyle: GoogleFonts.firaSans(
          fontSize: 16,
          // fontWeight: FontWeight.w600,
        ),
        icon: const Icon(
          Icons.show_chart_rounded,
          size: 30,
        ),
        title: 'Services',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: const Color.fromARGB(255, 167, 218, 245),
      ),
      PersistentBottomNavBarItem(
        textStyle: GoogleFonts.firaSans(
          fontSize: 16,
          // fontWeight: FontWeight.w600,
        ),
        icon: const Icon(
          Icons.history_outlined,
          size: 30,
        ),
        title: 'Complaint Screen',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: const Color.fromARGB(255, 167, 218, 245),
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const ServiceScreen(),
      const ComplaintScreen(),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          onItemSelected: (value) {
            if (value == 2) {
              RequestHistoryController requestHistoryController =
                  Get.put(RequestHistoryController());

              requestHistoryController.getRequestHistory();
            }
          },
          confineInSafeArea: true,
          neumorphicProperties: const NeumorphicProperties(),
          backgroundColor: const Color.fromARGB(255, 45, 151, 209),
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarHeight: 50,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            // borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
            colorBehindNavBar: AppColor.kPrimaryColor,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.bounceInOut,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style12,
        ),
      ),
    );
  }
}

Widget sliderView(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 1,
    decoration: const BoxDecoration(
      color: AppColor.kWhiteColor,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * .2,
          width: MediaQuery.sizeOf(context).width * 1,
          color: const Color.fromARGB(255, 55, 150, 228),
          // color: const Color.fromARGB(255, 45, 151, 209),
// Background color for profile section
          alignment: Alignment.center,
          child: Image.asset(AppImages.saifLogo),
        ),

        // Add some spacing between the profile section and the list items
        ListTile(
          leading: Icon(Icons.pin_end_rounded, size: 40, color: AppColor.kgrey),
          title: Text(
            "Complain",
            style: GoogleFonts.montserrat(
                fontSize: 18,
                ////fontWeight: FontWeight.bold,
                color: AppColor.kgrey),
          ),
          onTap: () => Get.toNamed(RoutesName.complainScreen),
        ),
        const SizedBox(
          height: 5,
        ),
        ListTile(
          leading: Icon(Icons.query_stats, size: 40, color: AppColor.kgrey),
          title: Text(
            "FaQ's",
            style: GoogleFonts.montserrat(
                fontSize: 18,
                ////fontWeight: FontWeight.bold,
                color: AppColor.kgrey),
          ),
          onTap: () => Get.toNamed(RoutesName.faqScreen),
        ),
        const SizedBox(
          height: 5,
        ),
        ListTile(
          onTap: () => Get.toNamed(RoutesName.aboutScreen),
          leading: Icon(Icons.info_outline, size: 40, color: AppColor.kgrey),
          title: Text(
            "About Us",
            style: GoogleFonts.montserrat(
                fontSize: 18,
                ////fontWeight: FontWeight.bold,
                color: AppColor.kgrey),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ListTile(
          leading:
              Icon(Icons.lock_clock_outlined, size: 40, color: AppColor.kgrey),
          title: Text(
            "Profile",
            style: GoogleFonts.montserrat(
                fontSize: 18,
                ////fontWeight: FontWeight.bold,
                color: AppColor.kgrey),
          ),
          onTap: () => Get.toNamed(RoutesName.updateProfileScreen),
        ),
        const SizedBox(
          height: 5,
        ),
        ListTile(
          leading: Icon(Icons.logout_rounded, size: 40, color: AppColor.kgrey),
          title: Text(
            "Log Out",
            style: GoogleFonts.montserrat(
                fontSize: 18,
                //fontWeight: FontWeight.bold,
                color: AppColor.kgrey),
          ),
          onTap: () {
            // Navigator.pushNamed(context, ScreenOne.id);
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .31,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Version : 0.0.1',
            style: GoogleFonts.montserrat(fontSize: 18, color: AppColor.kgrey),
          ),
        ),
      ],
    ),
  );
}
