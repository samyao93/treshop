part of '../all_product_page.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key}) : super(key: key);
  @override
  _AllProductScreenState createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  String _title = '';
  bool _isLowerPrice = false;
  List<ProductModel> productList = ProductList.allProduct;
  Comparator<ProductModel>? priceComparator;

  @override
  void initState() {
    super.initState();
    _title = Get.arguments as String;
  }

  Future _priceSort(bool? val) async {
    switch (val) {
      case true:
        // ignore: omit_local_variable_types
        priceComparator = (a, b) => a.price!.compareTo(b.price!.toInt());
        productList.sort(priceComparator);
        break;
      case false:
        // ignore: omit_local_variable_types
        priceComparator = (a, b) => b.price!.compareTo(a.price!.toInt());
        productList.sort(priceComparator);
        break;
      default:
        // ignore: omit_local_variable_types
        priceComparator = (a, b) => a.price!.compareTo(b.price!.toInt());
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
              onPressed: () => Get.toNamed<dynamic>(Routes.search),
              icon: const Icon(FeatherIcons.search),
            )
          ]),
      body: Column(
        children: [
          Container(
            width: Screens.width(context),
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  _title,
                  style: theme.textTheme.headline1!.copyWith(fontSize: 30),
                ),
                const SizedBox(height: Const.space15),
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
                    const SizedBox(width: 2),
                    _BuildFilterButton(
                      icon: FeatherIcons.filter,
                      label: AppLocalizations.of(context)!.filter,
                      onTap: () {
                        showFlexibleBottomSheet<dynamic>(
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
            child: ResponsiveGridList(
              desiredItemWidth: 170,
              minSpacing: Const.margin,
              children: productList.map((e) {
                final product = e;
                return ProductCard(product: product);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
