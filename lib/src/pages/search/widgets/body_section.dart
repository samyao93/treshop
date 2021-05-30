part of '../search_page.dart';


class _BodySection extends StatelessWidget {
  final List itemCount;

  const _BodySection({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        itemCount:itemCount.length,
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
          var product = itemCount[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
