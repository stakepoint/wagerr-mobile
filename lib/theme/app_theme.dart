import 'package:flutter/material.dart';
import 'package:starkwager/extensions/build_context_extension.dart';

class AppTheme {

  final BuildContext context;

  const AppTheme._(this.context);

  factory AppTheme.of(BuildContext context) => AppTheme._(context);

  static final fontFamily = 'General Sans';

  TextStyle get headingMobileH1 => TextStyle(
      fontFamily: fontFamily,
      fontSize: 40,
      fontWeight: FontWeight.w600,
      color: context.primaryTextColor
  );

  TextStyle get headLineLarge32 => TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: context.primaryTextColor
  );

  TextStyle get textSmallMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: context.primaryTextColor
  );

  TextStyle get textMediumMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: context.primaryTextColor
  );

  TextStyle get textMediumNormal => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: context.primaryTextColor
  );

  TextStyle get textRegularMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: context.primaryTextColor
  );

  TextStyle get titleExtraLarge24 => TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: context.primaryTextColor
  );

  TextStyle get titleLarge20 => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: context.primaryTextColor
  );

  TextStyle get bodyHuge20 => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: context.primaryTextColor
  );

  TextStyle get bodyExtraLarge18 => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: context.primaryTextColor
  );

  TextStyle get bodyLarge16 => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: context.primaryTextColor
  );

  TextStyle get bodyMedium14 => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: context.primaryTextColor
  );

  TextStyle get bodySmall12 => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: context.primaryTextColor
  );

  static final textTinyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static final textTinyNormal = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
