part of '../order_page.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.my_orders,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.search),
            icon: Icon(FeatherIcons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: OrderList.orderList.length,
        padding: EdgeInsets.symmetric(horizontal: Const.margin),
        itemBuilder: (context, index) {
          var order = OrderList.orderList[index];

          return OrderCard(order: order);
        },
      ),
    );
  }
}
