part of '../../feature.dart';

class WagerProfileMenu extends ConsumerWidget {
  const WagerProfileMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        _accountProfileImage(context),
        horizontalSpace(12),
        _copyUsername(context),
      ],
    );
  }
}

// COPY USERNAME
Widget _copyUsername(BuildContext context) => Container(
      height: 29,
      width: 116,
      child: Row(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('@noyi24_7', style: AppTheme.of(context).textSmallMedium),
          SvgPicture.asset(
            AppIcons.copyIcon,
            width: 15,
            height: 15,
          ),
        ],
      ),
    );

// USER PROFILE IMAGE

Widget _accountProfileImage(BuildContext context) => Container(
    height: 64,
    width: 64,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Image.asset(AppIcons.userImage, fit: BoxFit.cover));
