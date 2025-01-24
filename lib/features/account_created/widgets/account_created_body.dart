import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/features/account_created/provider/text_input_state.dart';
import 'package:starkwager/features/account_created/widgets/button.dart';
import 'package:starkwager/features/account_created/widgets/general_text_form_field.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class AccountCreatedBody extends ConsumerStatefulWidget {
  AccountCreatedBody({super.key});

  @override
  ConsumerState<AccountCreatedBody> createState() => _AccountCreatedBodyState();
}

class _AccountCreatedBodyState extends ConsumerState<AccountCreatedBody> {
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WAGER CREATED',
            style: AppTheme.headLineLarge32.copyWith(
                color: AppColors.blue950,
                fontWeight: FontWeight.w600,
                fontSize: 32),
          ),
          verticalSpace(8),
          Text(
            'Your wager has been created, send wager invite 🚀',
            style: AppTheme.textMediumNormal.copyWith(
                color: AppColors.grayCool600,
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
          verticalSpace(24),
          Container(
            height: 0.5,
            color: AppColors.mono60,
          ),
          verticalSpace(32),
          FormattedTextFields(
            height: 72,
            title: 'Invite through username',
            textFieldController: _usernameTextController,
            textFieldHint: 'wager.strk/@username',
            keyInputType: TextInputType.text,
            containerColor: AppColors.grayCool100_2,
            noBorder: true,
            focusNode: _usernameTextControllerFocusNode,
            inputFormatters: [],
            onChangedFunction: (value) {
              if (value.isEmpty ||
                  !_usernameTextController.text.startsWith('wager.strk/@')) {
                _usernameTextController.text = 'wager.strk/@';
                _usernameTextController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _usernameTextController.text.length));
              } else {
                return value;
              }
            },
            errorText: "",
            errorTextActive: false,
          ),
          verticalSpace(20),
          Text(
            'Invite publicly (Anyone with this link can join it)',
            style: AppTheme.textMediumNormal.copyWith(
                color: AppColors.blue950,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
          verticalSpace(12),
          GestureDetector(
            onTap: () {
              Clipboard.setData(
                  ClipboardData(text: 'https://link.wager.strk/WEpl'));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Link copied to clipboard'),
                ),
              );
            },
            child: Container(
              height: 72,
              padding: EdgeInsets.only(left: 18),
              decoration: BoxDecoration(
                color: AppColors.grayCool100_2,
                borderRadius: BorderRadius.circular(8),
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
                  Container(
                    height: 72,
                    width: 72,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.copyIcon2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _isMobile ? verticalSpace(150) : verticalSpace(24),
          _button(
              title: "Wager Invite",
              buttonColor: textInputState.color,
              textColor: textInputState.text,
              onPressed: () {},
              textInputState: textInputState),
          verticalSpace(12),
          _button(
              title: "Back Home",
              buttonColor: Color(0xFFFFFFFF),
              textColor: AppColors.blue950,
              onPressed: () {},
              textInputState: textInputState),
        ],
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
