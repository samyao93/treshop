part of '../order_page.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.offAllNamed<dynamic>(Routes.profile);
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          context,
          leadingOntap: () => Get.offAllNamed<dynamic>(Routes.profile),
          title: AppLocalizations.of(context)!.my_orders,
          actions: [
            IconButton(
              onPressed: () => Get.toNamed<dynamic>(Routes.search),
              icon: const Icon(FeatherIcons.search),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: OrderList.orderList.length,
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          itemBuilder: (context, index) {
            final order = OrderList.orderList[index];

            return OrderCard(order: order);
          },
        ),
      ),
    );
  }
}
