part of '../favorite_page.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.favorites,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed<dynamic>(Routes.favorite),
            icon: const Icon(FeatherIcons.search),
          )
        ],
      ),
      body: ResponsiveGridList(
        desiredItemWidth: 120,
        minSpacing: Const.margin,
        children: ProductList.allProduct.map((e) {
          final product = e;
          return ProductCard(product: product);
        }).toList(),
      ),
    );
  }
}
