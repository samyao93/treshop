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
      body: ResponsiveGridList(
        desiredItemWidth: 200,
        minSpacing: Const.margin,
        children: CategoryList.categoryList(context).map((e) {
          final category = e;
          return CategoryCard(
            category: category,
          );
        }).toList(),
      ),
    );
  }
}
