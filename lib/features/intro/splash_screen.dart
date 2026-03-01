import 'package:coursiq/core/constants/app_image.dart';
import 'package:coursiq/core/extension/navigator_app.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/features/auth/presentation/screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.pushRepalceMent(const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.primaryColor, AppColor.deepColor],
          ),
          image: DecorationImage(
            image: AssetImage(AppImage.logoB),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
