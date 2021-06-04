part of '../coupon_page.dart';

class _CouponListTabScreen extends StatelessWidget {
  final List itemCount;

  const _CouponListTabScreen({Key? key, required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, snapshot) {
        return ListView.builder(
          itemCount: itemCount.length,
          padding: EdgeInsets.symmetric(
            horizontal: Const.margin,
            vertical: Const.margin,
          ),
          itemBuilder: (context, index) {
            var coupon = itemCount[index];

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
        );
      },
    );
  }
}
