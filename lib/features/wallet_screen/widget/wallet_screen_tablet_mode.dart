part of '../../feature.dart';

class WalletScreenTabletMode extends ConsumerWidget {
  const WalletScreenTabletMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(32),
          TabletHeader(
            title: 'Home',
            onProfileTap: () => GoRouter.of(context).go(Routes.profileSetup),
          ),
          verticalSpace(120),
          WalletBodyPadding(
            child: const WalletScreenBody(),
          ),
        ],
      ),
    );
  }
}
