// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_app/resources/assets/app_image.dart';
import 'package:saif_app/resources/routes/routes_name.dart';
import 'package:saif_app/utils/utils.dart';
import 'package:saif_app/view_models/controller/store%20user%20session/store_user_data.dart';
import 'package:saif_app/views/home_screens/drawer_screen/request_history_screen.dart';
import 'package:saif_app/views/home_screens/home_screen.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../home_screens/services.dart';
import '../../resources/colors/app_colors.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen>
    with TickerProviderStateMixin {
  void _onItemTapped(int index) {
    // if(index==1){

    // };
    setState(() {
      selectedPage = index;
    });
  }

  final _pages = [
    const HomeScreen(),
    const ServiceScreen(),
    const RequestHistoryScreen(),
  ];
  int selectedPage = 0;
  PersistentTabController? _controller;
  final StoreUserData sessionController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List _navBarsItems() {
    return [
      (
        textStyle: GoogleFonts.montserrat(
          fontSize: 17,
          // fontWeight: FontWeight.w600,
        ),
        icon: const Icon(
          Icons.home_outlined,
          size: 30,
        ),
        title: 'Resident',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: const Color.fromARGB(255, 167, 218, 245),
      ),
      PersistentBottomNavBarItem(
        textStyle: GoogleFonts.firaSans(
          fontSize: 18,
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
          fontSize: 18,
          // fontWeight: FontWeight.w600,
        ),
        icon: const Icon(
          Icons.history_outlined,
          size: 30,
        ),
        title: 'Complaint',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: const Color.fromARGB(255, 167, 218, 245),
      ),
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
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        automaticallyImplyLeading: false,
        title: const Text("Saif Group"),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, size: 35, color: Colors.white));
        }),
      ),
      body: _pages[selectedPage],
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              color: AppColor.kbackGroundColor,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.16,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    AppImages.saifLogowhite,
                    width: MediaQuery.of(context).size.width *
                        0.1, // Adjust the width value as needed
                    height: MediaQuery.of(context).size.height *
                        0.12, // Adjust the height value as needed
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            // Add some spacing between the profile section and the list items

            ListTile(
              leading: const Icon(Icons.person,
                  size: 40, color: AppColor.blackColor),
              title: Text(
                "Profile",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: AppColor.blackColor,
                ),
              ),
              onTap: () => Get.toNamed(RoutesName.updateProfileScreen),
            ),
            const SizedBox(
              height: 5,
            ),

            ListTile(
              leading: const Icon(Icons.lock_outline,
                  size: 40, color: AppColor.blackColor),
              title: Text(
                "Change Password",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: AppColor.blackColor,
                ),
              ),
              onTap: () {
                Get.toNamed(RoutesName.changePasswordScreen);
              },
            ),

            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded,
                  size: 40, color: AppColor.blackColor),
              title: Text(
                "Log Out",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: AppColor.blackColor,
                ),
              ),
              onTap: () {
                sessionController.logout();
                Get.toNamed(RoutesName.loginScreen);
              },
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .495,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Version : 0.0.1',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: AppColor.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        items: Utils.kBottomNavigationBar,
        currentIndex: selectedPage,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
        unselectedItemColor: const Color.fromARGB(255, 142, 142, 142),
        type: BottomNavigationBarType.fixed,
      ),
    ));
  }
}
