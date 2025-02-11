part of '../../feature.dart';

class ProfileMenu extends ConsumerWidget {
  const ProfileMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        _userProfileImage(context.isMobile),
        horizontalSpace(12),
        _copyUserName(context.isMobile, context)
      ],
    );
  }

//----------------------------------------------- COPY_USERNAME ----------------------------------------------- //

  Widget _copyUserName(bool isMobile, BuildContext context) {
    return Container(
      height: isMobile ? 26 : 29,
      width: isMobile ? 104 : 117,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.containerColor,
      ),
      child: isMobile
          ? Row(
              spacing: 6,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('@noyi24_7', style: AppTheme.of(context).textSmallMedium),
                SvgPicture.asset(AppIcons.copyIcon)
              ],
            )
          : Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('@noyi24_7',
                    style: AppTheme.of(context).textRegularMedium),
                SvgPicture.asset(
                  AppIcons.copyIcon,
                  width: 15,
                  height: 15,
                ),
              ],
            ),
    );
  }

//----------------------------------------------- USER_PROFILE_IMAGE ----------------------------------------------- //

  Widget _userProfileImage(bool isMobile) {
    return Container(
      height: isMobile ? 48 : 64,
      width: isMobile ? 48 : 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(AppIcons.userImage),
    );
  }
}
