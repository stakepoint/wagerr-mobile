part of '../feature.dart';

class CreateWagerScreen extends ConsumerWidget {
  const CreateWagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final selectedHashtags = ref.watch(selectedHashtagsProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
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
      appBar: BaseAppbar(
          context: context, title: 'createWager'.tr(), userName: '@noyi24_7'),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: context.isMobile
                ? EdgeInsets.all(20)
                : EdgeInsets.symmetric(horizontal: 120),
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
                      style: AppTheme.of(context).headLineLarge32,
                    ),
                  ),
                verticalSpace(size.height * 0.02),
                if (context.isMobile) Divider(),
                verticalSpace(size.height * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _showCategoryDialog(context, ref),
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
                              Expanded(
                                child: Text(
                                  selectedCategory ?? 'selectCategory'.tr(),
                                  style: AppTheme.of(context).textMediumMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,
                                  color: context
                                      .primaryTextColor), // Dropdown icon
                            ],
                          ),
                        ),
                      ),
                    ),
                    horizontalSpace(AppValues.width16),
                    Expanded(
                      child: InkWell(
                        onTap: () => _showHashtagSelector(
                            context, ref, context.isMobile),
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
                                  style: AppTheme.of(context).textMediumMedium,
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

  Future<void> _showCategoryDialog(BuildContext context, WidgetRef ref) async {
    Future<String?> showBottomSheet(BuildContext context, Widget child) async {
      return await showModalBottomSheet<String>(
        context: context,
        backgroundColor: context.transparentColor,
        isScrollControlled: true,
        builder: (context) => Container(
          decoration: BoxDecoration(
            color: context.primaryBackgroundColor,
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
        backgroundColor: context.primaryBackgroundColor,
        surfaceTintColor: context.primaryBackgroundColor,
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: const EdgeInsets.only(right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(),
              Text(
                'selectCategory'.tr(),
                style: AppTheme.of(context).titleExtraLarge24,
              ),
              IconButton(
                icon: SvgPicture.asset(AppIcons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        content: SingleChildScrollView(
          child: SizedBox(
            width: 500,
            child: Column(
              children: [
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
                                    style: AppTheme.of(context).textSmallMedium,
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
                          buildDotedBorder(context),
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
            Container(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Container(),
                  Text(
                    'selectCategory'.tr(),
                    style: AppTheme.of(context).titleExtraLarge24,
                  ),
                  IconButton(
                    icon: SvgPicture.asset(AppIcons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            verticalSpace(30),
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
                                  style: AppTheme.of(context).textSmallMedium,
                                ),
                                SizedBox(width: 5),
                                if (ref.watch(selectedCategoryProvider) ==
                                    category)
                                  SvgPicture.asset(AppIcons.checked),
                              ],
                            ),
                          ),
                        ),
                        if (category != categories[categories.length - 1])
                          buildDotedBorder(context),
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

  Widget buildDotedBorder(BuildContext context) {
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
                  'addHashtag(s)'.tr(),
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

//----------------------------------------------- HASHTAG BOTTOM SHEET ----------------------------------------------- //
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
              colorFilter: ColorFilter.mode(
                  isSelected
                      ? context.primaryBackgroundColor
                      : context.primaryTextColor,
                  BlendMode.srcIn),
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
