part of '../search_page.dart';


class _BodySection extends StatelessWidget {
  final List<ProductModel> itemCount;

  const _BodySection({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        itemCount:itemCount.length,
        crossAxisCount: 4,
        staggeredTileBuilder: (int index) =>const StaggeredTile.fit(2),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15, 
        shrinkWrap: true,
        physics:const ScrollPhysics(),
        padding:const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        itemBuilder: (context, index) {
          final product = itemCount[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
