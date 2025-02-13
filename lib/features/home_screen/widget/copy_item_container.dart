part of '../../feature.dart';

class CopyItemContainer extends StatelessWidget {
  const CopyItemContainer({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: value));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('copiedToClipBoard'.tr()),
          ),
        );
      },
      child: Container(
        height: 29,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.containerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            spacing: 7,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(value,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.of(context).textSmallMedium),
              ),
              SvgPicture.asset(AppIcons.copyIcon)
            ],
          ),
        ),
      ),
    );
  }
}
