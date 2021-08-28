part of '../home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String _userImage =
      'https://i.pinimg.com/564x/fc/30/65/fc30653203c453c33b12d66f6837b6d5.jpg';

  TextEditingController? _searchController;

  final _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cart = Provider.of<CartProvider>(context);
    return SmartRefresher(
      controller: _refreshController,
      header: const WaterDropMaterialHeader(),
      onRefresh: () {
        Future.delayed(const Duration(seconds: 1), () {
          _refreshController.refreshCompleted();
          setState(() {});
        });
      },
      onLoading: () {
        Future.delayed(const Duration(seconds: 1), () {
          _refreshController.loadComplete();
          setState(() {});
        });
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          title: CircleAvatar(
            radius: 25,
            backgroundColor: theme.primaryColor,
            backgroundImage: const CachedNetworkImageProvider(_userImage),
          ),
          centerTitle: false,
          actions: [
            IconBadge(
              onTap: () => Get.toNamed<dynamic>(Routes.cart),
              icon: const Icon(FeatherIcons.shoppingCart),
              itemCount: cart.cartList.length,
              badgeColor: theme.primaryColor,
            ),
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(height: Const.space25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    AppLocalizations.of(context)!.trendias_Shop,
                    style: theme.textTheme.headline1!.copyWith(fontSize: 25),
                  ),
                  AutoSizeText(
                    AppLocalizations.of(context)!.get_popular_fashion_from_home,
                    style: theme.textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: Const.space15),
            _BuildSearch(
              controller: _searchController,
              onSearchTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                Get.toNamed<dynamic>(Routes.search,
                    arguments: _searchController?.text);
              },
            ),
            const SizedBox(height: Const.space25),
            _BuildLabelSection(
              label: AppLocalizations.of(context)!.categories,
              onViewAllTap: () {},
            ),
            const SizedBox(height: Const.space12),
            Container(
              width: Screens.width(context),
              height: 100,
              // color: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              child: ListView.builder(
                itemCount: CategoryList.categoryList(context).length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = CategoryList.categoryList(context)[index];
                  return CategoryCard(
                    category: category,
                    cardType: CardType.horizontal,
                  );
                },
              ),
            ),
            const SizedBox(height: Const.space25),
            _BuildLabelSection(
              label: AppLocalizations.of(context)!.categories,
              onViewAllTap: () => Get.toNamed<dynamic>(
                Routes.allProduct,
                arguments: AppLocalizations.of(context)!.all,
              ),
            ),
            const SizedBox(height: Const.space12),
            StaggeredGridView.countBuilder(
              itemCount: ProductList.allProduct.length,
              crossAxisCount: 4,
              staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15, 
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              itemBuilder: (context, index) {
                final product = ProductList.allProduct[index];
                return ProductCard(product: product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
