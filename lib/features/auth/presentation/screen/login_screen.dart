import 'package:coursiq/features/auth/presentation/widget/donot_have_account_widget.dart';
import 'package:coursiq/features/auth/presentation/widget/inputs_body_widget.dart';
import 'package:coursiq/features/auth/presentation/widget/well_come_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: .symmetric(horizontal: 24.0.w, vertical: 30.0.h),
          child: ListView(
            children: [
              WellComeWidget(),
              Gap(40.0.h),
              InputsBodyWidget(),
              DonotHaveAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
