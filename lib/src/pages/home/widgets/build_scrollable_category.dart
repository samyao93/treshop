part of '../home_page.dart';

class _BuildScrollableCategory extends StatelessWidget {
  const _BuildScrollableCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BuildLabelSection(
          label: AppLocalizations.of(context)!.categories,
          onViewAllTap: () =>Get.toNamed<dynamic>(Routes.category),
        ),
        const SizedBox(height: Const.space12),
        Container(
          width: Screens.width(context),
          height: 50,
          padding: const EdgeInsets.symmetric(
            horizontal: Const.margin,
          ),
          child: ListView.builder(
            itemCount: CategoryList.categoryList(context).length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = CategoryList.categoryList(context)[index];
              return CategoryCard(
                category: category,
                cardType: CardType.horizontal,
              );
            },
          ),
        ),
      ],
    );
  }
}
