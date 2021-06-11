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
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics:const ScrollPhysics(),
            padding:const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            itemBuilder: (context, index) {
              var category = CategoryList.categoryList(context)[index];
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
