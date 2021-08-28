part of '../product_page.dart';

class _BuildItemColor extends StatelessWidget {
  const _BuildItemColor({
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
              AppLocalizations.of(context)!.item_color,
              style: theme.textTheme.headline3,
            ),
         const   SizedBox(height: Const.space8),
            Row(
              children: product.itemColor!
                  .asMap()
                  .entries
                  .map(
                    (e) => Padding(
                        padding: const EdgeInsets.only(right: Const.space12),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            provider.itemColorSelected = e.key;
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: e.value,
                            child: (provider.itemColorSelected == e.key)
                                ? const Icon(Icons.check, color: Colors.white)
                                : const SizedBox(),
                          ),
                        )),
                  )
                  .toList(),
            ),
          ],
        ),
      );
    });
  }
}
