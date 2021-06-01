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
              style: theme.textTheme.headline3,
              maxLines: 2,
            ),
          ),
          SizedBox(width: Const.space12),
          Row(
            children: [
              Icon(
                Icons.star,
                color: ColorLight.warning,
                size: 14.0,
              ),
              SizedBox(width: 2.0),
              AutoSizeText(
                product.rating.toString(),
                style: theme.textTheme.headline4,
              ),
              SizedBox(width: Const.space8),
              AutoSizeText(
                "(" + product.totalReview.toString() + ")",
                style: theme.textTheme.subtitle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}