part of '../feature.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final _usernameController = TextEditingController();
  bool _isUsernameAvailable = false;
  File? _selectedImage;

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = ScreenLayout.isMobile(context);
            final isLandscape =
                MediaQuery.of(context).orientation == Orientation.landscape;

            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: isMobile
                          ? AppValues.padding24
                          : isLandscape
                              ? 184
                              : 120),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth:
                            isMobile ? AppValues.width600 : AppValues.width400),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(AppValues.height60),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: isMobile
                                    ? '${'setupYourProfile'.tr()}\n'
                                    : '${'setupYourProfile'.tr()} ',
                                style: AppTheme.of(context)
                                    .headLineLarge32
                                    .copyWith(
                                      height: 1.0,
                                    ),
                              ),
                              TextSpan(
                                text: 'PROFILE'.tr(),
                                style: AppTheme.of(context)
                                    .headLineLarge32
                                    .copyWith(
                                      height: isMobile ? 1.2 : 1.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(AppValues.height8),
                        Text(
                            isMobile
                                ? 'chooseProfilePicture'.tr()
                                : 'Choose your picture and a unique username other users can use to invite you to wagers'
                                    .split('\n')
                                    .join(' '),
                            style: AppTheme.of(context).bodyExtraLarge18),
                        Container(
                          height: 1,
                          color: context.dividerColor,
                          margin: const EdgeInsets.symmetric(
                              vertical: AppValues.height24),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: AppValues.padding8),
                          child: GestureDetector(
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? image = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (image != null) {
                                setState(() {
                                  _selectedImage = File(image.path);
                                });
                              }
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: _selectedImage != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.file(
                                            _selectedImage!,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            AppIcons.userImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                                Positioned(
                                  right: -4,
                                  bottom: -4,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black
                                              .withValues(alpha: 0.1),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(Icons.camera_alt,
                                        color: Colors.black, size: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpace(AppValues.height20),
                        Container(
                          padding: const EdgeInsets.all(AppValues.padding16),
                          decoration: BoxDecoration(
                            color: context.secondaryBackgroundColor,
                            borderRadius:
                                BorderRadius.circular(AppValues.radius16),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'wager.strk/',
                                style: AppTheme.of(context)
                                    .bodyExtraLarge18
                                    .copyWith(
                                      color: context.textHintColor,
                                    ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _usernameController,
                                  onChanged: _checkUsername,
                                  style: AppTheme.of(context).bodyExtraLarge18,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixText: '@',
                                    prefixStyle:
                                        AppTheme.of(context).bodyExtraLarge18,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_usernameController.text.isNotEmpty)
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, right: 8),
                              child: Text(
                                _isUsernameAvailable
                                    ? 'usernameAvailable'.tr()
                                    : 'usernameUnavailable'.tr(),
                                style:
                                    AppTheme.of(context).bodyLarge16.copyWith(
                                          color: _isUsernameAvailable
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                              ),
                            ),
                          ),
                        SizedBox(height: 40),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: AppValues.height40),
                          child: ElevatedButton(
                            onPressed: _usernameController.text.isEmpty ||
                                    !_isUsernameAvailable
                                ? null
                                : () {
                                    if (isMobile) {
                                      GoRouter.of(context).go(Routes.home);
                                    } else {
                                      GoRouter.of(context)
                                          .go(Routes.homeTablet);
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE7FF54),
                              minimumSize: const Size(
                                  double.infinity, AppValues.height56),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppValues.radius16),
                              ),
                            ),
                            child: Text(
                              'continue'.tr(),
                              style: AppTheme.of(context)
                                  .bodyExtraLarge18
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _checkUsername(String value) {
    setState(() {
      _isUsernameAvailable = value.length > 3;
    });
  }
}
