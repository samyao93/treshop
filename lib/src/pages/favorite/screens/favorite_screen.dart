part of '../favorite_page.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        enableLeading: false,
        title: AppLocalizations.of(context)!.favorites,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.favorite),
            icon: Icon(FeatherIcons.search),
          )
        ],
      ),
      body: StaggeredGridView.countBuilder(
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
    );
  }
}
