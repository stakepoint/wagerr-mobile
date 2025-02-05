part of '../../feature.dart';

class UsernameEditText extends StatelessWidget {
  const UsernameEditText(
      {super.key, required this.controller, required this.onValueChanged});

  final TextEditingController controller;
  final Function(String) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppValues.padding16),
      decoration: BoxDecoration(
        color: context.textBoxTextColor,
        borderRadius: BorderRadius.circular(AppValues.radius16),
      ),
      child: Row(
        children: [
          Text(
            'wager.strk/',
            style: AppTheme.of(context)
                .bodyExtraLarge18
                .copyWith(color: context.textHintColor),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onValueChanged,
              style: AppTheme.of(context)
                  .bodyExtraLarge18
                  .copyWith(fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixText: '@',
                prefixStyle: AppTheme.of(context).bodyExtraLarge18,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
