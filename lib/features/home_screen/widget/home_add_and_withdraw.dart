import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/features/home_screen/widget/home_action_button.dart';

class HomeAddAndWithdraw extends ConsumerWidget {
  const HomeAddAndWithdraw({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeActionButton(
          text: 'Add Money',
          iconPath: AppIcons.addIcon,
          onTap: () {},
        ),
        HomeActionButton(
          text: 'Withdraw',
          iconPath: AppIcons.withdrawIcon,
          onTap: () {},
        ),
      ],
    );
  }
}
