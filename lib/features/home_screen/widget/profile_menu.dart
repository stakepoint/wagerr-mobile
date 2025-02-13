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
        CopyItemContainer(value: '@noyi24_7'),
      ],
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
