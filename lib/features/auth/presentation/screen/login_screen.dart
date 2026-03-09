import 'package:coursiq/core/di/di.dart';
import 'package:coursiq/core/extension/navigator_app.dart';
import 'package:coursiq/core/function/loading_widget.dart';
import 'package:coursiq/core/helper/local_storage.dart';
import 'package:coursiq/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:coursiq/features/auth/presentation/widget/donot_have_account_widget.dart';
import 'package:coursiq/features/auth/presentation/widget/inputs_body_widget.dart';
import 'package:coursiq/features/auth/presentation/widget/well_come_widget.dart';
import 'package:coursiq/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) async {
            if (state is AuthSuccess) {
              context.pop();
              LocalStorageApp.saveData("step", "1");
              context.pushRepalceMent(HomeScreen());
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
                    WellComeWidget(),
                    Gap(40.0.h),
                    InputsBodyWidget(),
                    DonotHaveAccountWidget(),
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
