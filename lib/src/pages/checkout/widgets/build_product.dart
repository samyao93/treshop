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
          padding: const EdgeInsets.symmetric(
              horizontal: Const.margin),
          child: AutoSizeText(
              checkout!.products!.length.toString() +
                  " " +
                  AppLocalizations.of(context)!.items,
              style: theme.textTheme.headline3),
        ),
        SizedBox(height: Const.space8),
        Container(
          width: Screens.width(context),
          height: 128.0,
          child: ListView.builder(
            itemCount: checkout!.products!.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            padding:
                EdgeInsets.symmetric(horizontal: Const.margin),
            itemBuilder: (context, index) {
              var product = checkout!.products![index];

              return ProductCheckoutCard(product: product);
            },
          ),
        ),
      ],
    );
  }
}
