import 'package:coursiq/core/theme/app_theme.dart';
import 'package:coursiq/features/intro/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursiqApp extends StatelessWidget {
  const CoursiqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: SplashScreen(),
        );
      },
    );
  }
}
