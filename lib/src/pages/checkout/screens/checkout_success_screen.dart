part of '../checkout_page.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IllustrationWidget(
                icon: CustomIcon.shoppingBag,
                title: AppLocalizations.of(context)!.success,
                subtitle: AppLocalizations.of(context)!
                    .your_order_will_be_delivered_soon_thank_you_for_shopping,
              ),
              const SizedBox(height: Const.space25),
              CustomElevatedButton(
                onTap: () {
                  Get.offAllNamed<dynamic>(Routes.home);
                  context.read<CartProvider>().cartList.clear();
                },
                label: AppLocalizations.of(context)!.shopping_again,
              ),
              const SizedBox(height: Const.space15),
              CustomTextButton(
                label: AppLocalizations.of(context)!.see_my_orders,
                onTap: () {
                  Get.offAllNamed<dynamic>(Routes.order);
                  context.read<CartProvider>().cartList.clear();
                },
                textColor: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
