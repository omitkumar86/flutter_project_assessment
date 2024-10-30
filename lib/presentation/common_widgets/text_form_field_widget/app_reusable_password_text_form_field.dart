
import 'package:flutter/material.dart';
import 'package:flutter_project_assessment/presentation/theme/colors/app_colors.dart';
import 'package:flutter_project_assessment/presentation/theme/styles/app_styles.dart';

class AppReusablePasswordTextFormField extends StatefulWidget {
  const AppReusablePasswordTextFormField({
    super.key,
    required this.controller,
    this.textInputAction,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.onChanged,
  });

  final TextEditingController? controller;
  final dynamic validator;
  final dynamic onChanged;
  final TextInputAction? textInputAction;
  final String? hintText;
  final TextInputType? keyboardType;

  @override
  State<AppReusablePasswordTextFormField> createState() => _AppReusablePasswordTextFormFieldState();
}

class _AppReusablePasswordTextFormFieldState extends State<AppReusablePasswordTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      textAlign: TextAlign.justify,
      validator: widget.validator,
      cursorColor: AppColors.secondaryTextColor,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      textInputAction: widget.textInputAction ?? TextInputAction.send,
      obscureText: _obscureText,
      obscuringCharacter: "*",
      controller: widget.controller,
      style: myStyleRobotoCustom(fontSize: 12, color: AppColors.appBlackColor, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: AppColors.secondaryTextColor,
            size: 18,
          ),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        hintText: widget.hintText ?? "Enter Password",
        hintStyle: myStyleRobotoCustom(fontSize: 12,
            color: AppColors.secondaryTextColor, fontWeight: FontWeight.w400),
        filled: true,
        fillColor: AppColors.appWhiteColor,
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.appPrimaryColor),
            borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.appPrimaryColor),
            borderRadius: BorderRadius.circular(5)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.appPrimaryColor),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.appPrimaryColor),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
