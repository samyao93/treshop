part of '../favorite_page.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        enableLeading: false,
        title: AppLocalizations.of(context)!.favorites,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed<dynamic>(Routes.favorite),
            icon: const Icon(FeatherIcons.search),
          )
        ],
      ),
      body: StaggeredGridView.countBuilder(
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
    );
  }
}
