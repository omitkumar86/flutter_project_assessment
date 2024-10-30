
import 'package:flutter/material.dart';
import 'package:flutter_project_assessment/presentation/theme/colors/app_colors.dart';
import 'package:flutter_project_assessment/presentation/theme/styles/app_styles.dart';

class AppReusableTextFormField extends StatelessWidget {
  const AppReusableTextFormField({
    super.key,
    required this.controller,
    this.textInputAction,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.maxLines,
    this.onChanged,
    this.readOnly,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.onTap,
    this.borderColor,
  });

  final TextEditingController? controller;
  final dynamic validator;
  final dynamic onChanged;
  final TextInputAction? textInputAction;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final dynamic readOnly;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  final dynamic labelText;
  final dynamic hintStyle;
  final dynamic labelStyle;
  final dynamic onTap;
  final dynamic borderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      maxLines: maxLines,
      textAlign: TextAlign.justify,
      validator: validator,
      cursorColor: AppColors.secondaryTextColor,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      controller: controller,
      style: myStyleRobotoCustom(fontSize: 12, color: AppColors.appBlackColor, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: labelStyle ?? myStyleRobotoMedium(context: context, color: AppColors.appBlackColor),
        contentPadding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
        hintText: hintText ?? "Full Name",
        hintStyle: hintStyle ?? myStyleRobotoSmall(context: context, color: AppColors.appBlackColor.withOpacity(0.6)),
        filled: true,
        fillColor: AppColors.appWhiteColor,
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor ?? AppColors.appPrimaryColor),
            borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor ?? AppColors.appPrimaryColor),
            borderRadius: BorderRadius.circular(5)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor ?? AppColors.appPrimaryColor),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor ?? AppColors.appPrimaryColor),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
