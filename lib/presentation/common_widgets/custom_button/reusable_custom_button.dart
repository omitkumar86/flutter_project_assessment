
import 'package:flutter/material.dart';
import 'package:flutter_project_assessment/presentation/theme/colors/app_colors.dart';

class ReusableCustomButtonWidget extends StatelessWidget {
  const ReusableCustomButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.onHover,
    this.hoverColor,
    this.highlightColor,
    this.padding,
  });

  final VoidCallback? onTap;
  final Widget title;
  final Color? color;
  final dynamic onHover;
  final dynamic hoverColor;
  final dynamic highlightColor;
  final dynamic padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: WidgetStateProperty.all(color ?? AppColors.appPrimaryColor),
          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Add border radius here
            ),
          ),
          elevation: WidgetStateProperty.all(0),
          minimumSize: WidgetStateProperty.all(const Size(double.infinity, 40)),
        ),
        onPressed: onTap,
        child: title);
  }
}
