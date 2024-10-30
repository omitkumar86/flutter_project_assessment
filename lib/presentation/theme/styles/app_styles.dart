
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

/// For Roboto Google Font
myStyleRobotoCustom({
  required double fontSize,
  required Color color,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  TextDecoration? decoration,
  Color? decorationColor}){
  return GoogleFonts.roboto(fontSize: fontSize, color: color, fontWeight: fontWeight,
      fontStyle: fontStyle, decoration: decoration, decorationColor: decorationColor,
      letterSpacing: letterSpacing);
}

/// For Extra Large Size
myStyleRobotoExtraLarge({required BuildContext context, required Color color, FontWeight? fontWeight, double? fontSize}){
  return GoogleFonts.roboto(fontSize: 18, color: color, fontWeight: fontWeight ?? FontWeight.w800);
}

/// For Large Size
myStyleRobotoLarge({required BuildContext context, required Color color, FontWeight? fontWeight, double? fontSize}){
  return GoogleFonts.roboto(fontSize: 16, color: color, fontWeight: fontWeight ?? FontWeight.w600);
}

/// For Medium Size
myStyleRobotoMedium({required BuildContext context, required Color color, FontWeight? fontWeight, double? fontSize}){
  return GoogleFonts.roboto(fontSize: 14, color: color, fontWeight: fontWeight ?? FontWeight.w500);
}

/// For Small Size
myStyleRobotoSmall({required BuildContext context, required Color color, FontWeight? fontWeight, double? fontSize}){
  return GoogleFonts.roboto(fontSize: 12, color: color, fontWeight: fontWeight ?? FontWeight.w400);
}

/// For Very Small Size
myStyleRobotoVerySmall({required BuildContext context, required Color color, FontWeight? fontWeight, double? fontSize}){
  return GoogleFonts.roboto(fontSize: 10, color: color, fontWeight: fontWeight ?? FontWeight.w400);
}


