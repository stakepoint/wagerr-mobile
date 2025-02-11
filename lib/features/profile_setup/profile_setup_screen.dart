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
            final isLandscape =
                MediaQuery.of(context).orientation == Orientation.landscape;

            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.isMobile
                          ? AppValues.padding24
                          : isLandscape
                              ? 184
                              : 120),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: context.isMobile
                            ? AppValues.width600
                            : AppValues.width400),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(AppValues.height60),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: context.isMobile
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
                                      height: context.isMobile ? 1.2 : 1.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(AppValues.height8),
                        Text(
                            context.isMobile
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
                        UsernameEditText(
                          controller: _usernameController,
                          onValueChanged: _checkUsername,
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
                        PrimaryButton(
                          buttonText: 'continue'.tr(),
                          isActive: _usernameController.text.isNotEmpty &&
                              _isUsernameAvailable,
                          onPressed: () {
                            if (context.isMobile) {
                              GoRouter.of(context).go(Routes.home);
                            } else {
                              GoRouter.of(context).go(Routes.homeTablet);
                            }
                          },
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
