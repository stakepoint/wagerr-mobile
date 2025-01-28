import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class FormattedTextFields extends StatefulWidget {
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
  State<FormattedTextFields> createState() => _FormattedTextFieldsState();
}

class _FormattedTextFieldsState extends State<FormattedTextFields> {
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // Update the UI when the focus changes
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'inviteViaUsername'.tr(),
          style: AppTheme.textMediumNormal.copyWith(
              color: AppColors.blue950,
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
        verticalSpace(12),
        GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.requestFocus(),
          child: Container(
              height: widget.height ?? 72,
              padding: EdgeInsets.only(left: 18),
              alignment: widget.align ?? Alignment.centerLeft,
              decoration: BoxDecoration(
                color: AppColors.grayCool100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: _focusNode.hasFocus
                  ? RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'wager.strk/',
                            style: TextStyle(color: AppColors.gray),
                          ),
                          TextSpan(
                            text: '@',
                            style: TextStyle(color: AppColors.black),
                          ),
                          TextSpan(
                            text: 'username',
                            style: TextStyle(color: AppColors.gray),
                          ),
                        ],
                      ),
                    )
                  : TextFormField(
                      focusNode: widget.focusNode,
                      onTap: () {
                        print("tapped");
                        if (widget.onTap != null) {
                          widget.onTap!();
                        }
                      },
                      validator: (value) {
                        if (widget.validator != null) {
                          return widget.validator!(value!);
                        }
                        return null;
                      },
                      onChanged: widget
                          .onChangedFunction!, // this function to validate the
                      autofocus: widget.autoFocus ?? false,
                      enabled: widget.readOnly ?? true,
                      cursorHeight: widget.cursorHeight,
                      cursorColor: widget.cursorColor ?? AppColors.black,
                      textInputAction:
                          widget.textInputAction ?? TextInputAction.done,
                      keyboardType: widget.keyInputType,
                      obscureText: widget.obscureText ?? false,
                      obscuringCharacter: '*',
                      controller: widget.textFieldController,
                      textAlign: widget.textAlign ?? TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      enableInteractiveSelection:
                          widget.enableInteractiveSelection ?? true,
                      minLines: widget.textFieldMinLineSpan,
                      maxLines: widget.textFieldLineSpan ?? 1,
                      inputFormatters: widget.inputFormatters,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onEditingComplete: () {
                        if (widget.onEditingComplete != null)
                          widget.onEditingComplete!();
                      },

                      style: TextStyle(
                          fontSize: widget.textFont ?? 15,
                          fontWeight: widget.textFontWeight ?? FontWeight.w500),
                      decoration: InputDecoration(
                        prefixIcon: widget.prefixIcon,
                        fillColor: AppColors.gray,
                        filled: true,
                        suffixIcon: widget.suffixIcon,
                        prefix: widget.prefix,
                        hintStyle: TextStyle(
                            color: widget.hintColor ?? AppColors.gray,
                            fontSize: widget.hintFont ?? 14,
                            fontWeight:
                                widget.hintFontWeight ?? FontWeight.normal),
                        hintText: 'wager.strk/@username',
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 0, minHeight: 0),
                        disabledBorder: OutlineInputBorder(
                            borderSide: widget.noBorder == true
                                ? BorderSide.none
                                : BorderSide(
                                    color: widget.outLineBorderColor ??
                                        AppColors.gray,
                                    width: 1.0,
                                    style: widget.noBorder == true
                                        ? BorderStyle.none
                                        : BorderStyle.solid),
                            borderRadius: BorderRadius.circular(
                                screenSize(context).calculatedWidth(
                                    width: widget.borderRadius ?? 8))),
                        border: OutlineInputBorder(
                            borderSide: widget.noBorder == true
                                ? BorderSide.none
                                : BorderSide(
                                    color: widget.outLineBorderColor ??
                                        AppColors.gray,
                                    style: widget.noBorder == true
                                        ? BorderStyle.none
                                        : BorderStyle.solid),
                            borderRadius: BorderRadius.circular(
                                screenSize(context).calculatedWidth(
                                    width: widget.borderRadius ?? 8))),
                      ),
                    )),
        ),
        if (widget.errorTextActive == true) ...[
          verticalSpace(8),
          Text(
            widget.errorText!,
            style: AppTheme.textSmallMedium.copyWith(
                color: AppColors.rambutan100,
                fontWeight: FontWeight.w500,
                fontSize: 12),
          )
        ]
      ],
    );
  }
}
