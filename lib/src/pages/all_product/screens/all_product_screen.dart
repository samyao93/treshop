part of '../all_product_page.dart';

class AllProductScreen extends StatefulWidget {
  @override
  _AllProductScreenState createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  String _title = '';
  bool _isLowerPrice = false;
  List<ProductModel> productList = ProductList.allProduct;

  @override
  void initState() {
    super.initState();
    _title = Get.arguments;
  }

  _priceSort(bool? val) {
    switch (val) {
      case true:
        Comparator<ProductModel> priceComparator =
            (a, b) => a.price!.compareTo(b.price!.toInt());
        productList.sort(priceComparator);
        break;
      case false:
        Comparator<ProductModel> priceComparator =
            (a, b) => b.price!.compareTo(a.price!.toInt());
        productList.sort(priceComparator);
        break;
      default:
        Comparator<ProductModel> priceComparator =
            (a, b) => a.price!.compareTo(b.price!.toInt());
        productList.sort(priceComparator);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(context,
          title: AppLocalizations.of(context)!.categories,
          actions: [
            IconButton(
              onPressed: () => Get.toNamed(Routes.search),
              icon: Icon(FeatherIcons.search),
            )
          ]),
      body: Column(
        children: [
          Container(
            width: Screens.width(context),
            height: 120.0,
            padding: EdgeInsets.symmetric(horizontal: Const.margin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  _title,
                  style: theme.textTheme.headline1!.copyWith(fontSize: 30.0),
                ),
                SizedBox(height: Const.space15),
                Row(
                  children: [
                    _BuildFilterButton(
                      icon: (_isLowerPrice == true)
                          ? FeatherIcons.arrowDown
                          : FeatherIcons.arrowUp,
                      label: AppLocalizations.of(context)!.sort_by,
                      onTap: () {
                        setState(() {
                          _priceSort(_isLowerPrice = !_isLowerPrice);
                        });
                      },
                      isSort: true,
                    ),
                    SizedBox(width: 2),
                    _BuildFilterButton(
                      icon: FeatherIcons.filter,
                      label: AppLocalizations.of(context)!.filter,
                      onTap: () {
                        showFlexibleBottomSheet(
                          minHeight: 0,
                          initHeight: 0.5,
                          maxHeight: 1,
                          context: context,
                          builder: (
                            context,
                            scrollController1,
                            bottomSheetOffset,
                          ) {
                            return FilterScreen(
                              scrollController: scrollController1,
                            );
                          },
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              itemCount: productList.length,
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
                var product = productList[index];
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
