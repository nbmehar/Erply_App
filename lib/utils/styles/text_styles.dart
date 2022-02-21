import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:erply_login/constants/app_colors.dart';

abstract class Styles {
  static TextStyle get title => const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get heading1 => TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF252B2D));

  static TextStyle get heading2 => TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF252B2D));

  static TextStyle get heading3 => TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF464646));

  static TextStyle get subTitle =>
      TextStyle(fontSize: 14.sp, color: Colors.grey[600]);

  static TextStyle get bodyText1Black => const TextStyle(
        fontSize: 15.0,
      );

  static TextStyle get bodyText1BlackLarge => const TextStyle(
        fontSize: 17.0,
      );

  static TextStyle get bodyText1BlackMedium =>
      const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500);

  static TextStyle get bodyText1BlackMediumLarge =>
      const TextStyle(fontSize: 21.0, fontWeight: FontWeight.w500);

  static TextStyle get bodyText1BlackBold =>
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700);

  static TextStyle get bodyText1Grey =>
      TextStyle(fontSize: 15.0, color: Colors.grey[400]);

  static TextStyle get bodyText2Black => const TextStyle(
        fontSize: 13.0,
      );

  static TextStyle get bodyText2Grey =>
      TextStyle(fontSize: 13.0, color: Colors.grey[600]);

  static TextStyle get linkBold => TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w600,
      color: Colors.redAccent[200]);

  static TextStyle get linkRegular =>
      TextStyle(fontSize: 13.0, color: Colors.redAccent[200]);

  static TextStyle slimText(
          {Color fontColor = AppColors.white, double size = 18.0}) =>
      TextStyle(fontSize: size, color: fontColor, fontWeight: FontWeight.w300);
  static TextStyle smallText(
          {Color fontColor = AppColors.white, double size = 12.0}) =>
      TextStyle(
        fontSize: size,
        color: fontColor,
      );

  static TextStyle smallXText(
          {Color fontColor = AppColors.white, double size = 13.0}) =>
      TextStyle(fontSize: size, color: fontColor, letterSpacing: .5);

  static TextStyle xSmallTextMedium(
          {Color fontColor = AppColors.white, double size = 10.0}) =>
      TextStyle(fontSize: size, color: fontColor, fontWeight: FontWeight.w500);

  static TextStyle smallTextMedium(
          {Color fontColor = AppColors.white, double size = 12.0}) =>
      TextStyle(fontSize: size, color: fontColor, fontWeight: FontWeight.w500);

  static TextStyle regularText(
          {Color fontColor = AppColors.white, double size = 15.0}) =>
      TextStyle(
        fontSize: size,
        color: fontColor,
      );

  static TextStyle regularXText(
          {Color fontColor = AppColors.white, double size = 18.0}) =>
      TextStyle(
        fontSize: size,
        color: fontColor,
      );

  static TextStyle regularXTextSemiBold(
          {Color fontColor = AppColors.white, double size = 18.0}) =>
      TextStyle(fontSize: size, color: fontColor, fontWeight: FontWeight.w600);

  static TextStyle regularTextXBold(
          {Color fontColor = AppColors.white, double size = 18.0}) =>
      TextStyle(fontSize: size, color: fontColor, fontWeight: FontWeight.w800);

  static TextStyle smallTextSemiBold(
          {Color fontColor = AppColors.white, double size = 12.0}) =>
      TextStyle(fontSize: size, color: fontColor, fontWeight: FontWeight.w600);

  static TextStyle regularTextMedium(
          {Color fontColor = AppColors.white, double size = 15.0}) =>
      TextStyle(fontSize: size, color: fontColor, fontWeight: FontWeight.w500);

  static TextStyle regularXTextMedium(
          {Color fontColor = AppColors.white, double size = 17.0}) =>
      TextStyle(fontSize: size, color: fontColor, fontWeight: FontWeight.w500);

  static TextStyle regularTextSemiBold(
          {Color fontColor = AppColors.white, double size = 15.0}) =>
      TextStyle(fontSize: size, color: fontColor, fontWeight: FontWeight.w500);

  static TextStyle largeTextSemiBold(
          {Color fontColor = AppColors.white, double size = 20.0}) =>
      TextStyle(fontSize: size, color: fontColor, fontWeight: FontWeight.w600);

  static TextStyle largeTextMedium(
          {Color fontColor = AppColors.white, double size = 24.0}) =>
      TextStyle(fontSize: size, color: fontColor, fontWeight: FontWeight.w500);

  static TextStyle xlargeTextMedium(
          {Color fontColor = AppColors.white, double size = 32.0}) =>
      TextStyle(fontSize: size, color: fontColor, fontWeight: FontWeight.w500);
}
