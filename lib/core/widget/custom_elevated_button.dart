import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.style,
  });

  final VoidCallback onTap;
  final String title;
  final Color? color;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColor.accentColor,

        // shape: RoundedRectangleBorder(borderRadius: .circular(10.0)),
      ),
      onPressed: onTap,
      child: Text(
        title,
        style:
            style ??
            getBodyStyle(
              context: context,
              color: AppColor.white,
              fontSize: 17.0,
            ),
      ),
    );
  }
}
