part of '../feature.dart';

class WagerCreatedScreen extends ConsumerWidget {
  const WagerCreatedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: !context.isMobile
          ? BaseAppbar(
              context: context,
              title: '',
              userName: '@noyi_24',
              showBackButton: false,
            )
          : null,
      backgroundColor: context.primaryBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double maxWidth = AppValues.width500;
              final double maxWidthTablet = AppValues.width1440;
              return context.isMobile
                  ? ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: maxWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 100, left: 24, right: 24, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                WagerCreatedBody(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidthTablet),
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: AppValues.width500,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 120),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                WagerCreatedBody(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
