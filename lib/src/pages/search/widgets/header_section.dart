part of '../search_page.dart';

class _HeaderSection extends StatelessWidget {
  final TextEditingController? searchController;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSearchTap;
  final VoidCallback? onSortTap;
  final VoidCallback? onFilterTap;
  final int? productFound;

  const _HeaderSection({
    Key? key,
    this.onChanged,
    this.searchController,
    this.onSearchTap,
    this.onSortTap,
    this.productFound,
    this.onFilterTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: Screens.width(context),
      height: 85.0,
      padding: EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: theme.hintColor.withOpacity(.05),
                    borderRadius: BorderRadius.circular(Const.radius),
                  ),
                  child: TextField(
                    controller: searchController,
                    autocorrect: false,
                    autofocus: false,
                    style: theme.textTheme.bodyText2,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!
                          .search_anything_you_like,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: onSearchTap,
                        color: theme.primaryColor,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 5.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: Const.space12),
              CustomElevatedButton(
                onTap: onFilterTap,
                child: Icon(
                  FeatherIcons.sliders,
                  size: 20.0,
                ),
                width: 50.0,
                height: 50.0,
              ),
              SizedBox(width: Const.space12),
              CustomElevatedButton(
                onTap: onSortTap,
                child: Icon(
                  FeatherIcons.filter,
                  size: 20.0,
                ),
                width: 50.0,
                height: 50.0,
              ),
            ],
          ),
          SizedBox(height: Const.space8),
          AutoSizeText(
            productFound.toString() +" "+ AppLocalizations.of(context)!.products_found,
            style: theme.textTheme.headline3
          )
        ],
      ),
    );
  }
}
