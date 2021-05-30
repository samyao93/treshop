part of '../shop_page.dart';

class _BodyTabScreen extends StatelessWidget {
  final List itemCount;

  const _BodyTabScreen({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Const.margin,
              vertical: Const.space12,
            ),
            child: Image.asset(Images.shop_deals),
          ),
          StaggeredGridView.countBuilder(
            itemCount: itemCount.length,
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
              var category = itemCount[index];
              return CategoryCard(
                category: category,
                cardType: CardType.grid,
              );
            },
          ),
        ],
      ),
    );
  }
}
