part of '../shop_page.dart';

class _BodyTabScreen extends StatelessWidget {
  final List<CategoryModel> itemCount;

  const _BodyTabScreen({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Const.space25),
        Expanded(
          child: ResponsiveGridList(
            desiredItemWidth: 100,
            minSpacing: Const.margin,
            children: itemCount.map((e) {
              final category = e;
              return CategoryCard(
                category: category,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
