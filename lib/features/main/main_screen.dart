import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    Center(child: Text("search")),
    Center(child: Text("data")),
    Center(child: Text("data2")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Theme.of(
          context,
        ).bottomNavigationBarTheme.backgroundColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined, color: AppColor.greyColor64),
            activeIcon: Icon(Icons.dashboard, color: AppColor.accentColor),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined, color: AppColor.greyColor64),
            activeIcon: Icon(Icons.search, color: AppColor.accentColor),
            label: "search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined, color: AppColor.greyColor64),
            activeIcon: Icon(Icons.school, color: AppColor.accentColor),
            label: "My Courses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, color: AppColor.greyColor64),
            activeIcon: Icon(Icons.person_2, color: AppColor.accentColor),
            label: "Profile",
          ),
        ],
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}
