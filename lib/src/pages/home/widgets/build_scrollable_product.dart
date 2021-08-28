part of '../home_page.dart';

class _BuildScrollableProduct extends StatelessWidget {
  final List<ProductModel> itemList;
  final String label;
  final VoidCallback onSeeAllTap;

  const _BuildScrollableProduct({
    Key? key,
    required this.itemList,
    required this.label,
    required this.onSeeAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BuildLabelSection(
          label: label,
          onViewAllTap: onSeeAllTap,
        ),
        const SizedBox(height: Const.space12),
        SizedBox(
          width: Screens.width(context),
          height: 280,
          child: ListView.builder(
            itemCount: itemList.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            itemBuilder: (context, index) {
              final product = itemList[index];
              return _BuildProductCard(product: product);
            },
          ),
        )
      ],
    );
  }
}
