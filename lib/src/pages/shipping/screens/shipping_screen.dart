part of '../shipping_page.dart';

class ShippingScreen extends StatelessWidget {
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
          padding: EdgeInsets.symmetric(horizontal: Const.margin),
          itemBuilder: (context, index) {
            var shipping = ShippingList.shippingList[index];
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
                AppLocalizations.of(context)!.estimated +
                    " " +
                    shipping.estimate! +
                    " " +
                    AppLocalizations.of(context)!.days,
                style: theme.textTheme.subtitle2,
              ),
              trailing: AutoSizeText(
                NumberFormat.currency(symbol: '\$').format(shipping.price),
                style: theme.textTheme.headline3,
              ),
            );
          },
        ),
      );
    });
  }
}
