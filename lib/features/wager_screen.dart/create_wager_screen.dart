part of '../feature.dart';

class CreateWagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      style: AppTheme.of(context).headLineLarge32,
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
                        color: Colors.white,
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
                      style: AppTheme.of(context).headLineLarge32,
                    ),
                  ),
                verticalSpace(size.height * 0.02),
                if (context.isMobile) Divider(),
                verticalSpace(size.height * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        alignment: Alignment.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: context.textBoxTextColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        hint: Text('selectCategory'.tr()),
                        items: ["Category 1", "Category 2"]
                            .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category),
                                ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ),
                    horizontalSpace(AppValues.width16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: context.textBoxTextColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        hint: Text('addHashtags'.tr()),
                        items: ["#Hashtag1", "#Hashtag2"]
                            .map((hashtag) => DropdownMenuItem(
                                  value: hashtag,
                                  child: Text(hashtag),
                                ))
                            .toList(),
                        onChanged: (value) {},
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
                Container(
                  margin: EdgeInsets.only(
                    bottom: Platform.isIOS ? 30 : 0,
                  ),
                  height: AppValues.height56,
                  width: AppValues.width400,
                  child: TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(Routes.create_wager_summary);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: context.primaryButtonColor,
                      padding:
                          EdgeInsets.symmetric(vertical: AppValues.padding16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Continue".tr(),
                      style: AppTheme.of(context).bodyExtraLarge18.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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

  Column buildCreateWagerTextField(
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
                color: context.textHintColor, // Customize text color
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
}
