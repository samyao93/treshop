part of '../search_page.dart';


class _BodySection extends StatelessWidget {
  final List<ProductModel> itemCount;

  const _BodySection({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ResponsiveGridList(
        desiredItemWidth: 120,
        minSpacing: Const.margin,
        children: itemCount.map((e) {
          final product = e;
          return ProductCard(product: product);
        }).toList(),
      ),
    );
  }
}
