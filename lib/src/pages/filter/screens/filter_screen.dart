part of '../filter_page.dart';


class FilterScreen extends StatefulWidget {
  final FlexibleDraggableScrollableSheetScrollController? scrollController;

  const FilterScreen({
    Key? key,
    this.scrollController,
  }) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<SearchProvider>(builder: (context, provider, snapshot) {
      return Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Const.radius),
          topRight: Radius.circular(Const.radius),
        ),
        child: ListView(
          controller: widget.scrollController,
          padding: EdgeInsets.symmetric(horizontal: Const.margin),
          children: [
            SizedBox(height: Const.space8),
            Center(
              child: Container(
                width: Screens.width(context) / 10,
                height: 3,
                decoration: BoxDecoration(
                  color: theme.hintColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(Const.radius),
                ),
              ),
            ),
            SizedBox(height: Const.space25),
            Container(
              child: Row(
                children: [
                  AutoSizeText(
                    AppLocalizations.of(context)!.filter,
                    style: theme.textTheme.headline2,
                  ),
                  Spacer(),
                  CustomTextButton(
                    label: AppLocalizations.of(context)!.close,
                    onTap: () => Get.back(),
                    fontSize: 14.0,
                    textColor: theme.primaryColor,
                  ),
                  SizedBox(width: Const.space12),
                ],
              ),
            ),
            SizedBox(height: Const.space15),
            AutoSizeText(
              AppLocalizations.of(context)!.size,
              style: theme.textTheme.headline2,
            ),
            SizedBox(height: Const.space8),
            Row(
              children: SortAndFilterList.sizeList
                  .asMap()
                  .entries
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        provider.sizeSelected = e.key;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: Const.space12),
                        child: AutoSizeText(
                          e.value,
                          style: theme.textTheme.headline2!.copyWith(
                            color: (provider.sizeSelected == e.key)
                                ? theme.primaryColor
                                : null,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: Const.space15),
            AutoSizeText(
              AppLocalizations.of(context)!.color,
              style: theme.textTheme.headline2,
            ),
            SizedBox(height: Const.space8),
            Row(
              children: SortAndFilterList.colorList
                  .asMap()
                  .entries
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        provider.colorSelected = e.key;
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(right: Const.space12),
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: e.value,
                            child: (provider.colorSelected == e.key)
                                ? Icon(
                                    FeatherIcons.check,
                                    color: Colors.white,
                                  )
                                : SizedBox(),
                          )),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: Const.space15),
            AutoSizeText(
              AppLocalizations.of(context)!.categories,
              style: theme.textTheme.headline2,
            ),
            SizedBox(height: Const.space8),
            Wrap(
              children: SortAndFilterList.categoryList(context)
                  .asMap()
                  .entries
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        provider.categorySelected = e.key;
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(right: Const.space12),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Const.space15,
                              vertical: 5.0,
                            ),
                            margin: EdgeInsets.only(bottom: Const.space8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: (provider.categorySelected == e.key)
                                    ? theme.primaryColor
                                    : theme.hintColor,
                              ),
                              borderRadius: BorderRadius.circular(Const.radius),
                              color: (provider.categorySelected == e.key)
                                  ? theme.primaryColor
                                  : theme.backgroundColor,
                            ),
                            child: AutoSizeText(
                              e.value,
                              style: theme.textTheme.headline3!.copyWith(
                                color: (provider.categorySelected == e.key)
                                    ? Colors.white
                                    : null,
                              ),
                            ),
                          )),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: Const.space15),
            AutoSizeText(
              AppLocalizations.of(context)!.brand,
              style: theme.textTheme.headline2,
            ),
            SizedBox(height: Const.space8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Const.space12),
              decoration: BoxDecoration(
                color: theme.hintColor.withOpacity(.05),
                borderRadius: BorderRadius.circular(Const.radius),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: provider.brandSelected,
                  iconSize: 24,
                  elevation: 16,
                  style: theme.textTheme.subtitle1,
                  isExpanded: true,
                  hint: AutoSizeText('Select Brand',
                      style: theme.textTheme.subtitle1),
                  onChanged: (String? newValue) {
                    setState(() {
                      provider.brandSelected = newValue!;
                    });
                  },
                  items: SortAndFilterList.brandList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child:
                          AutoSizeText(value, style: theme.textTheme.bodyText2),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
