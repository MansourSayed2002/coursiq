import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/di/di.dart';
import 'package:coursiq/core/extension/navigator_app.dart';
import 'package:coursiq/core/function/loading_widget.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/core/widget/arrow_back_button_widget.dart';
import 'package:coursiq/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:coursiq/features/auth/presentation/widget/already_have_account_widget.dart';
import 'package:coursiq/features/auth/presentation/widget/inputs_body_sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(AppText.createAccount),
          leading: ArrowBackButtonWidget(),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) async {
            if (state is AuthSuccess) {
              context.pop();
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: AppText.transactionSuccess,
              );
            } else if (state is AuthLoading) {
              await loadingWidget(context);
            } else if (state is AuthErrors) {
              context.pop();
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: state.message.toString(),
              );
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: .symmetric(horizontal: 24.0.w, vertical: 30.0.h),
                child: ListView(
                  children: [
                    Text(
                      AppText.joinCoursiq,
                      style: getTitleStyle(context: context),
                    ),
                    Gap(10.0.h),
                    Text(
                      AppText.startYourPremiumLearning,
                      style: getSmallStyle(color: AppColor.white),
                    ),
                    Gap(40.0.h),
                    InputsBodySignUpWidget(),
                    Gap(35.0.h),
                    AlreadyHaveAccountWidget(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
