// ignore_for_file: deprecated_member_use

part of '../feature.dart';

class CreateWagerScreen extends ConsumerWidget {
  const CreateWagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery
        .of(context)
        .size;
    final isMobile = ScreenLayout.isMobile(context);
    final selectedHashtags = ref.watch(selectedHashtagsProvider);
    String getDisplayText() {
      if (selectedHashtags.isEmpty) {
        return 'addHashtags'.tr();
      }
      if (selectedHashtags.length == 1) {
        return '#${selectedHashtags.first}';
      }
      return '${selectedHashtags.length} selected';
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        backgroundColor: context.primaryBackgroundColor,
        toolbarHeight: context.isMobile ? null : AppValues.height100,
        elevation: 0,
        title: context.isMobile
            ? IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: SvgPicture.asset(AppIcons.arrowBack),
        )
            : Padding(
          padding: const EdgeInsets.only(left: 120),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  AppIcons.arrowBack,
                ),
                onPressed: () => GoRouter.of(context).pop(),
              ),
              Text(
                !context.isMobile ? 'createWager'.tr() : '',
                style: AppTheme
                    .of(context)
                    .headLineLarge32,
              ),
            ],
          ),
        ),
        actions: [
          if (!context.isMobile)
            Container(
              padding: EdgeInsets.only(right: 80),
              child: Row(
                children: [
                  Image.asset(AppIcons.userPath),
                  horizontalSpace(8),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: context.whiteColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Text(
                          '@noyi24_7',
                        ),
                        SvgPicture.asset(AppIcons.copyPath),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppValues.height20,
                  ),
                  SvgPicture.asset(AppIcons.notificationPath),
                ],
              ),
            )
        ],
        centerTitle: context.isMobile ? false : true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: AppValues.width500,
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: context.isMobile
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                if (context.isMobile)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'createWager'.tr(),
                      style: AppTheme
                          .of(context)
                          .headLineLarge32,
                    ),
                  ),
                verticalSpace(size.height * 0.02),
                if (context.isMobile) Divider(),
                verticalSpace(size.height * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _showCategoryDialog(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: context.textBoxTextColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedCategory ?? 'selectCategory'.tr(),
                                style: TextStyle(color: context.blackColor),
                              ),
                              Icon(Icons.arrow_drop_down,
                                  color: context.blackColor), // Dropdown icon
                            ],
                          ),
                        ),
                      ),
                    ),
                    horizontalSpace(AppValues.width16),
                    // Hashtags dropdown inside Expanded
                    Expanded(
                      child: InkWell(
                        onTap: () =>
                            _showHashtagSelector(context, ref, isMobile),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                          decoration: BoxDecoration(
                            color: context.textBoxTextColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  getDisplayText(),
                                  style: AppTheme
                                      .of(context)
                                      .textMediumMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,
                                  color: context.primaryTextColor),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(AppValues.height25),
                buildCreateWagerTextField(
                    context, 'titleOfYourWager'.tr(), 'wager.strk/'.tr(), 50),
                verticalSpace(AppValues.height30),
                buildCreateWagerTextField(context,
                    'termsOrWagerDescription'.tr(), 'wager.strk/'.tr(), 1000,
                    maxLine: 3),
                verticalSpace(AppValues.height30),
                buildStakeTextField(context, 'stake'.tr()),
                verticalSpace(size.height * 0.06),
                PrimaryButton(
                  buttonText: 'continue'.tr(),
                  isActive: true,
                  onPressed: () {
                    GoRouter.of(context).push(Routes.createWagerSummary);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //----------------------------------------------- STAKE FIELD ----------------------------------------------- //

  Widget buildStakeTextField(BuildContext context, String title) {
  Future<void> _showCategoryDialog(BuildContext context) async {
    Future<String?> showBottomSheet(BuildContext context, Widget child) async {
      return await showModalBottomSheet<String>(
        context: context,
        backgroundColor: context.transparentColor,
        isScrollControlled: true,
        builder: (context) => Container(
          decoration: BoxDecoration(
            color: context.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: FractionallySizedBox(
            heightFactor: 0.6,
            child: child,
          ),
        ),
      );
    }

    Future<String?> showCategoryDialog(
        BuildContext context, Widget child) async {
      return await showDialog<String>(
        context: context,
        builder: (context) => child,
      );
    }

    Widget buildCategorySelectionDialog(
        BuildContext context, List<String> categories) {
      return AlertDialog(
        backgroundColor: context.whiteColor,
        surfaceTintColor: context.whiteColor,
        titlePadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: IconButton(
                icon: SvgPicture.asset(AppIcons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: SizedBox(
            width: 500,
            child: Column(
              children: [
                Text(
                  'selectCategory'.tr(),
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                ...categories.map(
                  (category) => InkWell(
                    onTap: () => Navigator.of(context).pop(category),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    category,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  SizedBox(width: 5),
                                  if (ref.watch(selectedCategoryProvider) ==
                                      category)
                                    SvgPicture.asset(AppIcons.checked),
                                ],
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        if (category != categories[categories.length - 1])
                          buildDotedBorder(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildBottomSheet(List<String> categories) {
      return SizedBox(
        width: 500,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10),
                  child: IconButton(
                    icon: SvgPicture.asset(AppIcons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            verticalSpace(30),
            Text(
              'selectCategory'.tr(),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: categories.map((category) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(category);
                            ref.read(selectedCategoryProvider.notifier).state =
                                category;
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  category,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 5),
                                if (ref.watch(selectedCategoryProvider) ==
                                    category)
                                  SvgPicture.asset(AppIcons.checked),
                              ],
                            ),
                          ),
                        ),
                        buildDotedBorder(),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      );
    }

    final categoryNotifier = ref.watch(categoriesProvider);

    final selected = await (context.isMobile
        ? showBottomSheet(context, buildBottomSheet(categoryNotifier))
        : showCategoryDialog(
            context, buildCategorySelectionDialog(context, categoryNotifier)));
    if (selected != null) {
      ref.read(selectedCategoryProvider.notifier).state = selected;
    }
  }

  Widget buildDotedBorder() {
    return Row(
      children: List.generate(
          500 ~/ 10,
          (index) => Expanded(
                child: Container(
                  color: index % 2 == 0
                      ? Colors.transparent
                      : context.dividerColor,
                  height: 1,
                ),
              )),
    );
  }

  Column buildStakeTextField(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: AppTheme.of(context)
                .textSmallMedium
                .copyWith(fontWeight: FontWeight.w600)),
        SizedBox(
          height: 5,
        ),
        TextField(
          keyboardType: TextInputType.number,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            suffixText: "\$0",
            prefixIcon: Image.asset(AppIcons.snSymbol),
            filled: true,
            fillColor: context.textBoxTextColor,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        verticalSpace(5),
        Row(
          children: [
            Spacer(),
            Text(
              'youHave50.00Strk'.tr(),
              style: TextStyle(
                color: context.textHintColor,
              ),
            ),
          ],
        )
      ],
    );
  }

//----------------------------------------------- CATEGORYWAGER TEXTFIELD ----------------------------------------------- //

  Widget buildCreateWagerTextField(
      BuildContext context, String title, String hintText, int maxLength,
      {int maxLine = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.of(context).textSmallMedium,
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          buildCounter: (BuildContext context,
              {int? currentLength, int? maxLength, bool? isFocused}) {
            return Text(
              '$currentLength/$maxLength',
              style: TextStyle(
                color: context.textHintColor,
              ),
            );
          },
          maxLines: maxLine,
          maxLength: maxLength,
          decoration: InputDecoration(
            filled: true,
            fillColor: context.textBoxTextColor,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

//----------------------------------------------- HASHTAG SELECTORS ----------------------------------------------- //

  void _showHashtagSelector(
      BuildContext context, WidgetRef ref, bool isMobile) {
    if (isMobile) {
      showModalBottomSheet(
        backgroundColor: context.primaryBackgroundColor,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) => const HashtagBottomSheet(),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const HashtagDialog(),
      );
    }
  }
}

//----------------------------------------------- HASHTAG DIALOG ----------------------------------------------- //
class HashtagDialog extends ConsumerWidget {
  const HashtagDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hashtags = ref.watch(hashtagsListProvider);
    final selectedHashtags = ref.watch(selectedHashtagsProvider);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: context.primaryBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                horizontalSpace(140),
                Text(
                  textAlign: TextAlign.center,
                  'addHastag(s)'.tr(),
                  style: AppTheme.of(context).titleExtraLarge24,
                ),
                Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, size: 24),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            verticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Hashtagshelpotherusersfindyourwagereasilyandquickly'.tr(),
                  style: AppTheme.of(context).textMediumNormal,
                ),
              ],
            ),
            verticalSpace(24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  _buildHashtagChips(context, hashtags, selectedHashtags, ref),
            ),
          ],
        ),
      ),
    );
  }
}

//----------------------------------------------- HASHTAG BOTTOMSHEET ----------------------------------------------- //
class HashtagBottomSheet extends ConsumerWidget {
  const HashtagBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hashtags = ref.watch(hashtagsListProvider);
    final selectedHashtags = ref.watch(selectedHashtagsProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              horizontalSpace(95),
              Text(
                textAlign: TextAlign.center,
                'addHastag(s)'.tr(),
                style: AppTheme.of(context).titleExtraLarge24,
              ),
              Spacer(),
              IconButton(
                icon: const Icon(Icons.close, size: 24),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Hashtagshelpotherusersfindyourwagereasilyandquickly'.tr(),
                style: AppTheme.of(context).textMediumNormal,
              ),
            ],
          ),
          verticalSpace(24),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                _buildHashtagChips(context, hashtags, selectedHashtags, ref),
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}

//----------------------------------------------- HASHTAG CHIPS ----------------------------------------------- //

List<Widget> _buildHashtagChips(BuildContext context, List<String> hashtags,
    Set<String> selectedHashtags, WidgetRef ref) {
  return hashtags.map((hashtag) {
    final isSelected = selectedHashtags.contains(hashtag);
    return GestureDetector(
      onTap: () {
        ref.read(selectedHashtagsProvider.notifier).toggleHashtag(hashtag);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? context.primaryTextColor
              : context.secondaryTextColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppIcons.hashTagIcon,
              color: isSelected
                  ? context.primaryBackgroundColor
                  : context.primaryTextColor,
            ),
            horizontalSpace(4),
            Text(
              hashtag,
              style: AppTheme.of(context).textRegularMedium.copyWith(
                    color: isSelected
                        ? context.primaryBackgroundColor
                        : context.primaryTextColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }).toList();
}
