part of '../home_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String _userImage =
      'https://i.pinimg.com/564x/fc/30/65/fc30653203c453c33b12d66f6837b6d5.jpg';

  TextEditingController? _searchController;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    print('ewew');
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cart = Provider.of<CartProvider>(context);
    return SmartRefresher(
      controller: _refreshController,
      header: WaterDropMaterialHeader(),
      enablePullDown: true,
      onRefresh: () {
        Future.delayed(Duration(seconds: 1), () {
          _refreshController.refreshCompleted();
          setState(() {});
        });
      },
      onLoading: () {
        Future.delayed(Duration(seconds: 1), () {
          _refreshController.loadComplete();
          setState(() {});
        });
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          title: CircleAvatar(
            radius: 25.0,
            backgroundColor: theme.primaryColor,
            backgroundImage: CachedNetworkImageProvider(_userImage),
          ),
          centerTitle: false,
          actions: [
            IconBadge(
              onTap: () => Get.toNamed(Routes.cart),
              icon: Icon(FeatherIcons.shoppingCart),
              itemCount: cart.cartList.length,
              badgeColor: theme.primaryColor,
            ),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: Const.space25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    AppLocalizations.of(context)!.trendias_Shop,
                    style:
                        theme.textTheme.headline1!.copyWith(fontSize: 25.0),
                  ),
                  AutoSizeText(
                    AppLocalizations.of(context)!
                        .get_popular_fashion_from_home,
                    style: theme.textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            SizedBox(height: Const.space15),
            _BuildSearch(
              controller: _searchController,
              onSearchTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                Get.toNamed(Routes.search,
                    arguments: _searchController?.text);
              },
            ),
            SizedBox(height: Const.space25),
            _BuildLabelSection(
              label: AppLocalizations.of(context)!.categories,
              onViewAllTap: () {},
            ),
            SizedBox(height: Const.space12),
            Container(
              width: Screens.width(context),
              height: 100.0,
              // color: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: Const.margin),
              child: ListView.builder(
                itemCount: CategoryList.categoryList(context).length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var category = CategoryList.categoryList(context)[index];
                  return CategoryCard(
                    category: category,
                    cardType: CardType.horizontal,
                  );
                },
              ),
            ),
            SizedBox(height: Const.space25),
            _BuildLabelSection(
              label: AppLocalizations.of(context)!.categories,
              onViewAllTap: () {},
            ),
            SizedBox(height: Const.space12),
            StaggeredGridView.countBuilder(
              itemCount: ProductList.allProduct.length,
              crossAxisCount: 4,
              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              itemBuilder: (context, index) {
                var product = ProductList.allProduct[index];
                return ProductCard(product: product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
