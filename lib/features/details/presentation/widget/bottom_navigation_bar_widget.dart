import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/di/di.dart';
import 'package:coursiq/core/extension/navigator_app.dart';
import 'package:coursiq/core/function/loading_widget.dart';
import 'package:coursiq/core/helper/local_storage.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/details/data/model/input_subscription.dart';
import 'package:coursiq/features/details/presentation/cubit/details_cubit.dart';
import 'package:coursiq/features/home/data/model/recommended_courses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.recommendedCoursesModel,
  });
  final RecommendedCoursesModel recommendedCoursesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 20.0.w, vertical: 10.0.h),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Text(AppText.price, style: getSmallStyle()),
                Text(
                  "\$${recommendedCoursesModel.price.toString()}",
                  style: getBodyStyle(context: context),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () async {
                String uuid =
                    await LocalStorageApp.getSecureStorage("id") ?? "";
                await getIt<DetailsCubit>().subscription(
                  InputSubscription(
                    uuid: uuid,
                    idCourse: recommendedCoursesModel.id,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.accentColor,
              ),
              child: BlocConsumer<DetailsCubit, DetailsState>(
                buildWhen: (previous, current) =>
                    current is SubscriptionLoading ||
                    current is SubscriptionSuccess ||
                    current is SubscriptionError,
                listener: (context, state) async {
                  if (state is SubscriptionError) {
                    context.pop();
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      text: state.message.toString(),
                    );
                  } else if (state is SubscriptionSuccess) {
                    context.pop();
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: AppText.subscribed,
                    );
                  } else if (state is SubscriptionLoading) {
                    await loadingWidget(context);
                  }
                },
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        AppText.enrolnNow,
                        style: getBodyStyle(context: context),
                      ),
                      Icon(Icons.arrow_forward, color: AppColor.white),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
