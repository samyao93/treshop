part of '../coupon_page.dart';

class CouponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          context,
          title: AppLocalizations.of(context)!.my_coupon,
          bottom: PreferredSize(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Const.radius),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(Const.radius),
                  color: theme.primaryColor,
                ),
                indicatorColor: theme.primaryColor,
                labelStyle: theme.textTheme.bodyText2,
                labelColor: Colors.white,
                unselectedLabelStyle: theme.textTheme.subtitle1,
                unselectedLabelColor: theme.hintColor,
                tabs: [
                  Tab(text: AppLocalizations.of(context)!.all),
                  Tab(text: AppLocalizations.of(context)!.used),
                  Tab(text: AppLocalizations.of(context)!.expired),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(50.0),
          ),
        ),
        body: TabBarView(
          children: [
            _CouponListTabScreen(itemCount: CouponList.couponList),
            _CouponListTabScreen(itemCount: CouponList.usedList),
            _CouponListTabScreen(itemCount: CouponList.expiredList),
          ],
        ),
      ),
    );
  }
}
