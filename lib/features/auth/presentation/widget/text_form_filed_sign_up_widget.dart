import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/di/di.dart';
import 'package:coursiq/core/function/validation.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/core/widget/custom_elevated_button.dart';
import 'package:coursiq/core/widget/custom_text_from_global.dart';
import 'package:coursiq/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFiledSignUpWidget extends StatefulWidget {
  const TextFormFiledSignUpWidget({super.key});

  @override
  State<TextFormFiledSignUpWidget> createState() =>
      _TextFormFiledSignUpWidgetState();
}

class _TextFormFiledSignUpWidgetState extends State<TextFormFiledSignUpWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  bool isVisibleOff = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          AppText.fullName,
          style: getSmallStyle(fontSize: 14.0.sp, color: AppColor.greyColorCB),
        ),
        Gap(8.0.h),
        SizedBox(
          height: 55.0.h,
          child: CustomTextFormGlobal(
            controller: fullNameController,
            cursorColor: AppColor.accentColor,
            hinttext: AppText.hintFullName,
            prefixIcon: Icon(
              Icons.person_2_outlined,
              color: AppColor.greyColor64,
            ),
            validator: (value) {
              return validationField(context, "text", 8, 20, value);
            },
          ),
        ),
        Gap(20.0.h),
        Text(
          AppText.email,
          style: getSmallStyle(fontSize: 14.0.sp, color: AppColor.greyColorCB),
        ),
        Gap(8.0.h),
        SizedBox(
          height: 55.0.h,
          child: CustomTextFormGlobal(
            controller: emailController,
            cursorColor: AppColor.accentColor,
            hinttext: AppText.hintEmail,
            prefixIcon: Icon(Icons.email_outlined, color: AppColor.greyColor64),
            validator: (value) {
              return validationField(context, "email", 8, 50, value);
            },
          ),
        ),
        Gap(20.0.h),
        Text(
          AppText.password,
          style: getSmallStyle(fontSize: 14.0.sp, color: AppColor.greyColorCB),
        ),
        Gap(8.0.h),
        SizedBox(
          height: 55.0.h,
          child: CustomTextFormGlobal(
            obscureText: isVisibleOff,
            controller: passwordController,
            cursorColor: AppColor.accentColor,
            hinttext: AppText.hintPassword,
            prefixIcon: Icon(Icons.lock_outline, color: AppColor.greyColor64),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisibleOff = !isVisibleOff;
                });
              },
              icon: Icon(
                isVisibleOff
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColor.greyColor64,
              ),
            ),
            validator: (value) {
              return validationField(context, "number", 8, 20, value);
            },
          ),
        ),
        Gap(32.0.h),
        SizedBox(
          width: double.infinity,
          height: 60.0.h,
          child: CustomElevatedButton(
            title: AppText.createAccount,
            onTap: () async {
              await getIt<AuthCubit>().createAccount(
                email: emailController.text.trim(),
                fullName: fullNameController.text.trim(),
                password: passwordController.text.trim(),
              );
              emailController.clear();
              passwordController.clear();
              fullNameController.clear();
            },
          ),
        ),
      ],
    );
  }
}
