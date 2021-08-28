part of '../home_page.dart';

class _BuildProductCard extends StatelessWidget {
  const _BuildProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: Const.space15),
      child: InkWell(
        onTap: () => Get.toNamed<dynamic>(Routes.product, arguments: product),
        borderRadius: BorderRadius.circular(Const.radius),
        child: Container(
          width: 170,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: _theme.cardColor,
            borderRadius: BorderRadius.circular(Const.radius),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Const.radius),
                      ),
                      child: Text(
                        '30% OFF',
                        style: _theme.textTheme.headline4,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: _theme.disabledColor,
                    )
                  ],
                ),
              ),
              Expanded(
                child: OctoImage(
                  image: CachedNetworkImageProvider(
                    product.images!.first,
                  ),
                ),
              ),
              const SizedBox(height: Const.space8),
              Container(
                width: 170,
                height: 70,
                padding: const EdgeInsets.all(Const.space8),
                decoration: BoxDecoration(
                  color: _theme.backgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(Const.radius),
                    bottomRight: Radius.circular(Const.radius),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        product.name ?? '',
                        maxLines: 1,
                        style: _theme.textTheme.bodyText2,
                      ),
                    ),
                    const SizedBox(height: Const.space8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          NumberFormat.currency(
                            symbol: r'$',
                            decimalDigits: 0,
                          ).format(700),
                          style: _theme.textTheme.headline3,
                        ),
                        const SizedBox(width: Const.space5),
                        Text(
                          NumberFormat.currency(
                            symbol: r'$',
                            decimalDigits: 0,
                          ).format(1000),
                          style: _theme.textTheme.subtitle2?.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
