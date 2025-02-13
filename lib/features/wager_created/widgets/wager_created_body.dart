part of '../../feature.dart';

class WagerCreatedBody extends ConsumerStatefulWidget {
  const WagerCreatedBody({super.key});

  @override
  ConsumerState<WagerCreatedBody> createState() => _AccountCreatedBodyState();
}

class _AccountCreatedBodyState extends ConsumerState<WagerCreatedBody> {
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
    return Consumer(builder: (context, ref, child) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'wagerCreated'.tr(),
                style: AppTheme.of(context)
                    .headLineLarge32
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 32),
              ),
              verticalSpace(8),
              Text('sendWagerInvite'.tr(),
                  style: AppTheme.of(context)
                      .textMediumNormal
                      .copyWith(color: context.subTitleTextColor)),
              verticalSpace(22),
              Container(
                height: 0.5,
                color: AppColors.mono60,
              ),
              verticalSpace(30),
              Text('inviteUsername'.tr(),
                  style: AppTheme.of(context)
                      .bodyMedium14
                      .copyWith(fontWeight: FontWeight.w500)),
              verticalSpace(AppValues.height8),
              UsernameEditText(
                controller: _usernameTextController,
                onValueChanged: (value) {},
              ),
              verticalSpace(20),
              Text(
                'publicInvite'.tr(),
                style: AppTheme.of(context)
                    .textMediumNormal
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              verticalSpace(12),
              Container(
                height: 72,
                padding: EdgeInsets.only(left: 18),
                decoration: BoxDecoration(
                  color: context.secondaryBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'https://link.wager.strk/WEpl',
                        style: AppTheme.of(context).textRegularMedium.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                            text: 'https://link.wager.strk/WEpl'));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('copiedToClipBoard'.tr()),
                          ),
                        );
                      },
                      child: Container(
                        height: 72,
                        width: 72,
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: context.primaryButtonColor,
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
              context.isMobile ? verticalSpace(80) : verticalSpace(24),
              PrimaryButton(
                buttonText: 'sendWager'.tr(),
                isActive: true,
                onPressed: () {},
              ),
              verticalSpace(12),
              _button(
                title: 'backHome'.tr(),
                buttonColor: context.containerColor,
                textColor: context.primaryTextColor,
                onPressed: () => context.go(Routes.profileSetup),
              ),
            ],
          ),
        ),
      );
    });
  }

  _button(
      {String? title, required Function onPressed, buttonColor, textColor}) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        height: 56,
        alignment: Alignment.center,
        width: screenSize(context).width,
        decoration: BoxDecoration(
          color: buttonColor ?? context.primaryTextColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title ?? 'No Title',
          style: AppTheme.of(context)
              .textRegularMedium
              .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }
}
