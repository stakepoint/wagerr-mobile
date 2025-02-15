part of '../feature.dart';

class ContractAddress extends StatelessWidget {
  final bool isTablet;
  const ContractAddress({Key? key, this.isTablet = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use different text styles if needed.
    final titleStyle = isTablet
        ? AppTheme.of(context).bodyLarge16.copyWith(
              color: context.textHintColor,
            )
        : AppTheme.of(context).bodyMedium14.copyWith(
              color: context.textHintColor,
            );
    final addressStyle = isTablet
        ? AppTheme.of(context).textRegularMedium
        : AppTheme.of(context).textSmallMedium;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('walletBalance'.tr(), style: titleStyle),
        Container(
          height: 29,
          width: 151,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.containerColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0x400e44000...', style: addressStyle),
              SvgPicture.asset(AppIcons.copyIcon),
            ],
          ),
        ),
      ],
    );
  }
}
