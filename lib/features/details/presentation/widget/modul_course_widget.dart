import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/details/presentation/cubit/details_cubit.dart';
import 'package:coursiq/features/details/presentation/widget/card_modul_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModulCourseWidget extends StatelessWidget {
  const ModulCourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      buildWhen: (previous, current) =>
          current is DetailsLoading ||
          current is DetailsSuccess ||
          current is DetailsError,
      builder: (context, state) {
        if (state is DetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.accentColor),
          );
        } else if (state is DetailsError) {
          return Center(
            child: Column(
              children: [
                Icon(Icons.warning, color: AppColor.yellowColor, size: 30.0.sp),
                Text(state.message, style: getSmallStyle()),
              ],
            ),
          );
        } else if (state is DetailsSuccess) {
          return ListView.builder(
            itemCount: state.moduls.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                CardModulWidget(modulsModel: state.moduls[index]),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
