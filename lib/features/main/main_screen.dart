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
    Center(child: Text("data")),
    Center(child: Text("data2")),
    Center(child: Text("data3")),
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
            icon: Icon(Icons.dashboard_outlined, color: AppColor.greyColor64),
            activeIcon: Icon(Icons.dashboard, color: AppColor.accentColor),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined, color: AppColor.greyColor64),
            activeIcon: Icon(Icons.dashboard, color: AppColor.accentColor),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined, color: AppColor.greyColor64),
            activeIcon: Icon(Icons.dashboard, color: AppColor.accentColor),
            label: "Home",
          ),
        ],
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}
