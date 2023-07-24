import 'package:flutter/material.dart';
import 'package:myapp/utils/utils.dart';
import 'package:myapp/views/home_screens/home_screen.dart';
import 'package:myapp/views/home_screens/profile_screen/profile_screen.dart';
import 'package:myapp/views/home_screens/service_history_screen/service_history_screen.dart.dart';
import 'package:myapp/views/home_screens/service_screens/allServicesScreen.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  int _selectedIndex = 0;
  final List _widgetOptions = [
    const HomeScreen(),
    AllServicesScreen(),
    const ServiceHistoryScreen(),
    const ProfileScreen()
  ];

  List<BottomNavigationBarItem> bottomList = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings_applications), label: 'Services'),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: 'History',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff436eee),
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.blueGrey,
        items: bottomList,
        onTap: _onItemTapped,
        selectedLabelStyle: SafeGoogleFont('montserrat',
            fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: SafeGoogleFont('montserrat',
            fontSize: 12, fontWeight: FontWeight.w400),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
