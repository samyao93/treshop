part of '../order_detail_page.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final order = OrderList.orderList[1];

    String _statusOrderLabelType(OrderStatus val) {
      switch (val) {
        case OrderStatus.onDelivery:
          return AppLocalizations.of(context)!.on_delivery;
        case OrderStatus.packaging:
          return AppLocalizations.of(context)!.packaging;
        case OrderStatus.success:
          return AppLocalizations.of(context)!.success;
        default:
          return AppLocalizations.of(context)!.not_pay;
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.order_detail,
      ),
      body: ListView(
        padding:const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          AutoSizeText(
            AppLocalizations.of(context)!.status,
            style: theme.textTheme.subtitle2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                _statusOrderLabelType(order.status!),
                style: theme.textTheme.bodyText1!.copyWith(
                  color: theme.primaryColor,
                ),
              ),
              CustomTextButton(
                label: AppLocalizations.of(context)!.show,
                onTap: () => Get.toNamed<dynamic>(Routes.trackingOrder),
                textColor: theme.primaryColor,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(AppLocalizations.of(context)!.shopping_date,
                  style: theme.textTheme.bodyText2),
              AutoSizeText(DateFormat.yMMMEd().format(order.dateOrder!),
                  style: theme.textTheme.headline3),
            ],
          ),
     const     SizedBox(height: Const.space15),
          AutoSizeText(
            '${order.products!.length} ${AppLocalizations.of(context)!.items}',
            style: theme.textTheme.headline3,
          ),
       const   SizedBox(height: Const.space8),
          ListView.builder(
            itemCount: order.products!.length,
            shrinkWrap: true,
            physics:const ScrollPhysics(),
            itemBuilder: (context, index) {
              final product = order.products![index];
              return OrderDetailCard(order: product);
            },
          ),
         const SizedBox(height: Const.space15),
          AutoSizeText(
            AppLocalizations.of(context)!.delivery_status,
            style: theme.textTheme.headline3,
          ),
     const     SizedBox(height: Const.space8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: AutoSizeText(
                  AppLocalizations.of(context)!.shipping_code,
                  style: theme.textTheme.subtitle1,
                ),
              ),
              Expanded(
                child: AutoSizeText(
                  '#ADR-108567298',
                  style: theme.textTheme.headline4,
                ),
              ),
            ],
          ),
         const SizedBox(height: Const.space8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: AutoSizeText(
                  AppLocalizations.of(context)!.detail_address,
                  style: theme.textTheme.subtitle1,
                ),
              ),
              Expanded(
                child: AutoSizeText(
    '403 Oakland Ave Street, A city, Florida, 32104, United States of America',
                  style: theme.textTheme.headline4,
                ),
              ),
            ],
          ),
        const  SizedBox(height: Const.space15),
          AutoSizeText(
            AppLocalizations.of(context)!.payment_information,
            style: theme.textTheme.headline3,
          ),
       const   SizedBox(height: Const.space8),
          _BuildPaymentInformation(
            label: AppLocalizations.of(context)!.payment_method,
            trailing: 'PayPal',
          ),
          Divider(color: theme.hintColor),
          _BuildPaymentInformation(
            label: AppLocalizations.of(context)!.shipping_fee,
            value: 5,
          ),
         const SizedBox(height: Const.space8),
          _BuildPaymentInformation(
            label: '${AppLocalizations.of(context)!.discount} 10%',
            value: 5,
            isDiscount: true,
          ),
         const SizedBox(height: Const.space8),
          _BuildPaymentInformation(
            label: AppLocalizations.of(context)!.price_total,
            value: 50,
          ),
          Divider(color: theme.hintColor),
          _BuildPaymentInformation(
            label: AppLocalizations.of(context)!.total,
            value: 50,
            isTotal: true,
          ),
         const SizedBox(height: Const.space25),
        ],
      ),
    );
  }
}
