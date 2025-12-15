import 'package:btccloudmining/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textRoboto(BuildContext context, {double? fontSize, FontWeight? fontWeight, Color? color}) {
  return GoogleFonts.roboto(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? 14,
  );
}

TextStyle subTextRoboto(BuildContext context, {double? fontSize, FontWeight? fontWeight, Color? color}) {
  return GoogleFonts.roboto(
    color: color ?? AppColor.subText,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? 14,
  );
}

TextStyle textMontserrat(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return GoogleFonts.montserrat(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? 14,
  );
}

TextStyle subTextMontserrat(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return GoogleFonts.montserrat(
    color: color ?? AppColor.subText,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? 14,
  );
}
