part of '../shop_page.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<ThemeProvider>(
      builder: (context, themeProv, snapshot) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: CustomAppBar(
              context,
              enableLeading: false,
              title: AppLocalizations.of(context)!.categories,
              actions: [
                IconButton(
                  onPressed: () => Get.toNamed(Routes.search),
                  icon: const Icon(FeatherIcons.search),
                ),
              ],
              bottom: TabBar(
                labelStyle: theme.textTheme.headline4,
                unselectedLabelStyle: theme.textTheme.bodyText2,
                labelColor: theme.primaryColor,
                unselectedLabelColor: (themeProv.isLightTheme == true)
                    ? ColorLight.fontDisable
                    : ColorDark.fontDisable,
                tabs: [
                  Tab(text: AppLocalizations.of(context)!.men),
                  Tab(text: AppLocalizations.of(context)!.women),
                  Tab(text: AppLocalizations.of(context)!.kids),
                  Tab(text: AppLocalizations.of(context)!.luxury),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _BodyTabScreen(itemCount: CategoryList.menList(context)),
                _BodyTabScreen(itemCount: CategoryList.womanList(context)),
                _BodyTabScreen(itemCount: CategoryList.kidsList(context)),
                _BodyTabScreen(itemCount: CategoryList.luxuryList(context)),
              ],
            ),
          ),
        );
      },
    );
  }
}
