part of '../shop_page.dart';

class _BodyTabScreen extends StatelessWidget {
  final List<CategoryModel> itemCount;

  const _BodyTabScreen({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Const.margin,
            vertical: Const.space12,
          ),
          child: Image.asset(Images.shopDeals),
        ),
        StaggeredGridView.countBuilder(
          itemCount: itemCount.length,
          crossAxisCount: 4,
          staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
          mainAxisSpacing: 15,
          crossAxisSpacing: 15, 
          shrinkWrap: true,
          physics:const ScrollPhysics(),
          padding:const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          itemBuilder: (context, index) {
            final category = itemCount[index];
            return CategoryCard(
              category: category,
              cardType: CardType.grid,
            );
          },
        ),
      ],
    );
  }
}
