import 'package:flutter/material.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/utils/ui_widgets.dart';

// is to be used in column, rows and other grid element
Widget button(BuildContext context,
    {String? text = 'No text',
    String? navigateTo,
    double? radius,
    Color? buttonColor,
    Color? textColor,
    Color? borderColor,
    Function? onTap,
    double? width,
    Alignment? align,
    Widget? child,
    final dynamic onPressed,
    FontWeight? fontWeight,
    final double? noElevation,
    FocusNode? focusNode,
    double? fontSize,
    Widget? widget,
    double? height}) {
  Orientation orientation = MediaQuery.of(context).orientation;
  return ElevatedButton(
      focusNode: focusNode ?? FocusNode(),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          elevation: noElevation ?? 4.0,
          alignment: align,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? context.primaryButtonColor),
            borderRadius: BorderRadius.circular(
                screenSize(context).calculatedHeight(height: radius)),
          ),
          fixedSize: Size(
              orientation == Orientation.portrait
                  ? screenSize(context).calculatedWidth(width: width)
                  : screenSize(context).calculatedWidth(width: width),
              orientation == Orientation.landscape
                  ? screenSize(context).calculatedHeight(height: height)
                  : screenSize(context).calculatedHeight(height: height))),
      child: child ??
          Text(
            text!,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize ?? 16,
                fontWeight: fontWeight ?? FontWeight.w500),
          ));
}
