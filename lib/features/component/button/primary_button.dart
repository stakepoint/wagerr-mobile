part of '../../feature.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.isActive,
  });

  final String buttonText;
  final Function() onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppValues.height56,
      width: screenSize(context).width,
      child: TextButton(
        onPressed: () => isActive ? onPressed() : () {},
        style: TextButton.styleFrom(
          backgroundColor: isActive
              ? context.primaryButtonColor
              : context.primaryButtonColor.withValues(alpha: 0.32),
          padding: EdgeInsets.symmetric(vertical: AppValues.padding16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          buttonText,
          style: AppTheme.of(context).bodyExtraLarge18.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
