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

