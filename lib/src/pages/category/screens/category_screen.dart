part of '../category_page.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.categories,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Const.margin,
              vertical: Const.space12,
            ),
            child: Image.asset(Images.shopDeals),
          ),
          StaggeredGridView.countBuilder(
            itemCount: CategoryList.categoryList(context).length,
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
              final category = CategoryList.categoryList(context)[index];
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
