part of '../product_page.dart';

class _BuildNameAndRating extends StatelessWidget {
  const _BuildNameAndRating({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AutoSizeText(
              product.name!,
              style: theme.textTheme.headline1,
              maxLines: 2,
            ),
          ),
          const SizedBox(width: Const.space12),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: ColorLight.warning,
                size: 14,
              ),
              const SizedBox(width: 2),
              AutoSizeText(
                product.rating.toString(),
                style: theme.textTheme.headline4,
              ),
              const SizedBox(width: Const.space8),
              AutoSizeText(
                '(${product.totalReview})',
                style: theme.textTheme.subtitle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
