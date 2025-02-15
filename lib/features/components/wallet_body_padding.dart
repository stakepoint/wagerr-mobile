
part of '../feature.dart';

class WalletBodyPadding extends StatelessWidget {
  final Widget child;
  const WalletBodyPadding({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isLandscape ? 120 : 60),
      child: child,
    );
  }
}