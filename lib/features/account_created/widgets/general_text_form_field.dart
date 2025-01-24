import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class FormattedTextFields extends StatelessWidget {
  final String? title;
  final TextInputType keyInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? textFieldController;
  final int? textFieldMinLineSpan, textFieldLineSpan, maxLength;
  final String? textFieldHint;
  final double? height, width, textFont, hintFont, labelFont, borderRadius;
  final String? errorText;
  final Color? containerColor,
      cursorColor,
      hintColor,
      labelColor,
      outLineBorderColor,
      focusBorderColor;
  final bool? noBorder, autoFocus, obscureText, readOnly;
  final Function(dynamic)? onChangedFunction;
  final Function? onTap, onEditingComplete;
  final List<TextInputFormatter> inputFormatters;
  final bool errorTextActive;
  final FocusNode? focusNode;
  final Widget? prefixIcon, suffixIcon;
  final Widget? prefix;
  final FontWeight? textFontWeight, hintFontWeight, labelFontWeight;
  final FloatingLabelBehavior? labelBehaviour;
  final bool? enableInteractiveSelection;
  final Alignment? align;
  final Function(String)? validator;
  final double? cursorHeight;
  final TextAlign? textAlign;
  final EdgeInsets? contentPadding;

  const FormattedTextFields({
    super.key,
    this.title,
    required this.keyInputType,
    required this.textFieldController,
    required this.textFieldHint,
    this.textFieldLineSpan,
    this.height,
    this.width,
    this.validator,
    this.errorText,
    this.textFieldMinLineSpan,
    this.containerColor,
    this.enableInteractiveSelection,
    required this.noBorder,
    this.autoFocus,
    this.textInputAction,
    required this.inputFormatters,
    required this.onChangedFunction,
    required this.errorTextActive,
    required this.focusNode,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.textFont,
    this.hintFont,
    this.labelFont,
    this.cursorHeight,
    this.borderRadius,
    this.cursorColor,
    this.hintColor,
    this.labelColor,
    this.outLineBorderColor,
    this.focusBorderColor,
    this.textFontWeight,
    this.hintFontWeight,
    this.labelFontWeight,
    this.obscureText,
    this.labelBehaviour,
    this.maxLength,
    this.align,
    this.onTap,
    this.readOnly,
    this.textAlign,
    this.contentPadding,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Invite through username',
          style: AppTheme.textMediumNormal.copyWith(
              color: AppColors.blue950,
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
        verticalSpace(12),
        Container(
          height: height ?? 52,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColors.grayCool100_2,
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
            focusNode: focusNode,
            onTap: () {
              print("tapped");
              if (onTap != null) {
                onTap!();
              }
            },
            validator: (value) {
              if (validator != null) {
                return validator!(value!);
              }
              return null;
            },
            onChanged: onChangedFunction!, // this function to validate the
            autofocus: autoFocus ?? false,
            enabled: readOnly ?? true,
            cursorHeight: cursorHeight,
            cursorColor: cursorColor ?? Colors.black,
            textInputAction: textInputAction ?? TextInputAction.done,
            keyboardType: keyInputType,
            obscureText: obscureText ?? false,
            obscuringCharacter: '*',
            controller: textFieldController,
            textAlign: textAlign ?? TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            enableInteractiveSelection: enableInteractiveSelection ?? true,
            minLines: textFieldMinLineSpan,
            maxLines: textFieldLineSpan ?? 1,
            inputFormatters: inputFormatters,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onEditingComplete: () {
              if (onEditingComplete != null) onEditingComplete!();
            },

            style: TextStyle(
                fontSize: textFont ?? 15,
                fontWeight: textFontWeight ?? FontWeight.w500),
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              fillColor: AppColors.grayCool100_2,
              filled: true,
              suffixIcon: suffixIcon,
              prefix: prefix,
              hintStyle: TextStyle(
                  color: hintColor ?? Color(0xFFB9C0D4),
                  fontSize: hintFont ?? 14,
                  fontWeight: hintFontWeight ?? FontWeight.normal),
              hintText: textFieldHint,
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              contentPadding: contentPadding ??
                  EdgeInsets.fromLTRB(
                      screenSize(context).calculatedWidth(width: 14),
                      screenSize(context).calculatedHeight(height: 12),
                      0,
                      0),
              disabledBorder: OutlineInputBorder(
                  borderSide: noBorder == true
                      ? BorderSide.none
                      : BorderSide(
                          color: outLineBorderColor ?? Colors.grey,
                          width: 1.0,
                          style: noBorder == true
                              ? BorderStyle.none
                              : BorderStyle.solid),
                  borderRadius: BorderRadius.circular(screenSize(context)
                      .calculatedWidth(width: borderRadius ?? 8))),
              border: OutlineInputBorder(
                  borderSide: noBorder == true
                      ? BorderSide.none
                      : BorderSide(
                          color: outLineBorderColor ?? Colors.grey,
                          // width: 1.5,
                          style: noBorder == true
                              ? BorderStyle.none
                              : BorderStyle.solid),
                  borderRadius: BorderRadius.circular(screenSize(context)
                      .calculatedWidth(width: borderRadius ?? 8))),
            ),
          ),
        ),
        if (errorTextActive == true) ...[
          verticalSpace(8),
          Text(
            errorText!,
            style: AppTheme.textSmallMedium.copyWith(
                color: Colors.red, fontWeight: FontWeight.w500, fontSize: 12),
          )
        ]
      ],
    );
  }
}
