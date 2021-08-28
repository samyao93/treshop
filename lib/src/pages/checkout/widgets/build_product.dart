part of '../checkout_page.dart';

class _BuildProducts extends StatelessWidget {
  const _BuildProducts({
    Key? key,
    required this.checkout,
  }) : super(key: key);

  final CheckoutModel? checkout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: AutoSizeText(
     '${checkout!.products!.length} ${AppLocalizations.of(context)!.items}',
              style: theme.textTheme.headline3),
        ),
        const SizedBox(height: Const.space8),
        SizedBox(
          width: Screens.width(context),
          height: 140,
          child: ListView.builder(
            itemCount: checkout!.products!.length,
            scrollDirection: Axis.horizontal,
            physics:const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: Const.margin,
            ),
            itemBuilder: (context, index) {
              final product = checkout!.products![index];

              return ProductCheckoutCard(product: product);
            },
          ),
        ),
      ],
    );
  }
}
