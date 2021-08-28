part of '../product_page.dart';

class _BuildItemSize extends StatelessWidget {
  const _BuildItemSize({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Consumer<ProductProvider>(builder: (context, provider, snapshot) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              AppLocalizations.of(context)!.item_size,
              style: _theme.textTheme.headline3,
            ),
            const SizedBox(height: Const.space8),
            Row(
              children: product.itemSize!
                  .asMap()
                  .entries
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: Const.space12),
                      child: InkWell(
                        onTap: () {
                          provider.itemSizeSelected = e.key;
                        },
                        borderRadius: BorderRadius.circular(25),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: (provider.itemSizeSelected == e.key)
                              ? _theme.primaryColor
                              : _theme.cardColor,
                          child: AutoSizeText(
                            e.value,
                            style: _theme.textTheme.headline4?.copyWith(
                              color: (provider.itemSizeSelected == e.key)
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );
    });
  }
}
