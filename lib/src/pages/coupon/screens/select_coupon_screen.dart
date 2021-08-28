part of '../coupon_page.dart';

class SelectCouponScreen extends StatelessWidget {
  const SelectCouponScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, snapshot) {
      return Scaffold(
        appBar: CustomAppBar(
          context,
          title: AppLocalizations.of(context)!.available_coupon,
        ),
        body: ListView.builder(
          itemCount: CouponList.couponList.length,
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          itemBuilder: (context, index) {
            final coupon = CouponList.couponList[index];

            return CouponCard(
              coupon: coupon,
              buttonLabel: (cart.selectedCoupon == index)
                  ? AppLocalizations.of(context)!.active
                  : AppLocalizations.of(context)!.use,
              buttonColor: (cart.selectedCoupon == index)
                  ? Theme.of(context).hintColor
                  : Theme.of(context).primaryColor,
              onUseTap: () {
                cart.selectedCoupon = index;
              },
            );
          },
        ),
      );
    });
  }
}
