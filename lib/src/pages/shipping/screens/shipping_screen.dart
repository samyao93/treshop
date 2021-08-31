part of '../shipping_page.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<CheckoutProvider>(builder: (context, checkout, snapshot) {
      return Scaffold(
        appBar: CustomAppBar(
          context,
          title: AppLocalizations.of(context)!.payment_method,
        ),
        body: ListView.builder(
          itemCount: ShippingList.shippingList.length,
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          itemBuilder: (context, index) {
            final shipping = ShippingList.shippingList[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Radio(
                value: index,
                activeColor: theme.primaryColor,
                groupValue: checkout.shippingSelected,
                onChanged: (int? v) {
                  checkout.shippingSelected = v!;
                },
              ),
              title: AutoSizeText(
                shipping.name!,
                style: theme.textTheme.headline3,
              ),
              subtitle: AutoSizeText(
                // ignore: lines_longer_than_80_chars
                '${AppLocalizations.of(context)!.estimated} ${shipping.estimate!} ${AppLocalizations.of(context)!.days}',
                style: theme.textTheme.subtitle2,
              ),
              trailing: AutoSizeText(
                NumberFormat.currency(symbol: r'$').format(shipping.price),
                style: theme.textTheme.headline3,
              ),
            );
          },
        ),
      );
    });
  }
}
