part of '../home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? _searchController;

  final _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                top: 60,
                child: ListView(
                  children: [
                    const SizedBox(height: Const.space25),
                    const _BuildHeader(),
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
                    const _BuildScrollableCategory(),
                    const SizedBox(height: Const.space25),
                    _BuildScrollableProduct(
                      itemList: ProductList.flashSaleProductList,
                      label: AppLocalizations.of(context)!.flash_sale,
                      onSeeAllTap: () => Get.toNamed<dynamic>(
                        Routes.allProduct,
                        arguments: AppLocalizations.of(context)!.all,
                      ),
                    ),
                    const SizedBox(height: Const.space25),
                    _BuildScrollableProduct(
                      itemList: ProductList.allProduct,
                      label: AppLocalizations.of(context)!.top_of_the_week,
                      onSeeAllTap: () {},
                    ),
                  ],
                ),
              ),
              const _BuildAppBar()
            ],
          ),
        ),
      ),
    );
  }
}
