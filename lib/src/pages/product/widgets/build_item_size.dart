part of '../product_page.dart';

class _BuildItemSize extends StatelessWidget {
  const _BuildItemSize({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<ProductProvider>(builder: (context, provider, snapshot) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              AppLocalizations.of(context)!.item_size,
              style: theme.textTheme.headline3,
            ),
            SizedBox(height: Const.space8),
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
                        borderRadius: BorderRadius.circular(25.0),
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: theme.cardColor,
                          child: AutoSizeText(
                            e.value,
                            style: theme.textTheme.headline4!.copyWith(
                              color: (provider.itemSizeSelected == e.key)
                                  ? theme.primaryColor
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