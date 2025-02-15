part of '../feature.dart';


class TransactionItem extends StatelessWidget {
  final String description;
  final String date;
  final String amount;
  final Color? iconBgColor;
  final bool isUpward;
  final bool showGreenAmount;

  const TransactionItem({
    Key? key,
    required this.description,
    required this.date,
    required this.amount,
    this.iconBgColor,
    required this.isUpward,
    this.showGreenAmount = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              isUpward ? AppIcons.upwardArrow : AppIcons.downwardArrow,
              width: 20,
              height: 20,
              // Optional: Tint the icon if needed.
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: AppTheme.of(context).bodyExtraLarge18.copyWith(color: AppColors.blue950),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  date,
                  style: AppTheme.of(context).bodyMedium14.copyWith(
                        color: AppColors.blue950,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(right: 4),
                child: Image.asset(AppIcons.starknetImage),
              ),
              const SizedBox(width: 4),
              Text(
                amount,
                style: AppTheme.of(context).bodyLarge16.copyWith(
                      color: showGreenAmount ? Colors.green : null,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


