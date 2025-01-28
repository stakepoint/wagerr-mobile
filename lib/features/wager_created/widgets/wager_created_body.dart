import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/features/wager_created/provider/text_input_state.dart';
import 'package:starkwager/features/wager_created/widgets/general_text_form_field.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class WargerCreatedBody extends ConsumerStatefulWidget {
  WargerCreatedBody({super.key});

  @override
  ConsumerState<WargerCreatedBody> createState() => _AccountCreatedBodyState();
}

class _AccountCreatedBodyState extends ConsumerState<WargerCreatedBody> {
  late TextEditingController _usernameTextController;
  late FocusNode _usernameTextControllerFocusNode;
  late bool hasEnteredUsername = false;

  @override
  void initState() {
    super.initState();
    _usernameTextController = TextEditingController();
    _usernameTextControllerFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    _usernameTextControllerFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _isMobile = ScreenLayout.isMobile(context);

    return Consumer(builder: (context, ref, child) {
      final textInputState = ref.watch(textInputProvider);
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'wagerCreated'.tr(),
                style: AppTheme.headLineLarge32.copyWith(
                    color: AppColors.blue950,
                    fontWeight: FontWeight.w600,
                    fontSize: 32),
              ),
              verticalSpace(8),
              Text(
                'sendWagerInvite'.tr(),
                style: AppTheme.textMediumNormal.copyWith(
                    color: AppColors.grayCool800,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              verticalSpace(22),
              Container(
                height: 0.5,
                color: AppColors.mono60,
              ),
              verticalSpace(30),
              FormattedTextFields(
                height: 72,
                title: 'inviteUsername'.tr(),
                textFieldController: _usernameTextController,
                textFieldHint: 'wager.strk/@username',
                keyInputType: TextInputType.text,
                containerColor: AppColors.grayCool200,
                noBorder: true,
                focusNode: _usernameTextControllerFocusNode,
                inputFormatters: [],
                onChangedFunction: (value) {
                  if (value.isEmpty ||
                      !_usernameTextController.text
                          .startsWith('wager.strk/@')) {
                    _usernameTextController.text = 'wager.strk/@';
                    _usernameTextController.selection =
                        TextSelection.fromPosition(TextPosition(
                            offset: _usernameTextController.text.length));
                  } else {
                    return value;
                  }
                },
                errorText: "",
                errorTextActive: false,
              ),
              verticalSpace(20),
              Text(
                'publicInvite'.tr(),
                style: AppTheme.textMediumNormal.copyWith(
                    color: AppColors.blue950,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              verticalSpace(12),
              Container(
                height: 72,
                padding: EdgeInsets.only(left: 18),
                decoration: BoxDecoration(
                  color: AppColors.grayCool100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'https://link.wager.strk/WEpl',
                        style: AppTheme.textRegularMedium.copyWith(
                            color: AppColors.blue950,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                            text: 'https://link.wager.strk/WEpl'));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('linkCopied'.tr()),
                          ),
                        );
                      },
                      child: Container(
                        height: 72,
                        width: 72,
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.copyIcon,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _isMobile ? verticalSpace(80) : verticalSpace(24),
              _button(
                  title: 'sendWager'.tr(),
                  buttonColor: textInputState.color,
                  textColor: textInputState.text,
                  onPressed: () {},
                  textInputState: textInputState),
              verticalSpace(12),
              _button(
                  title: 'backHome'.tr(),
                  buttonColor: Color(0xFFFFFFFF),
                  textColor: AppColors.blue950,
                  onPressed: () {},
                  textInputState: textInputState),
            ],
          ),
        ),
      );
    });
  }

  _button(
      {String? title,
      required Function onPressed,
      required textInputState,
      buttonColor,
      textColor}) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        height: 56,
        alignment: Alignment.center,
        width: screenSize(context).width,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.blue950,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title ?? 'No Title',
          style: AppTheme.textRegularMedium.copyWith(
              color: AppColors.blue950,
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
      ),
    );
  }
}
