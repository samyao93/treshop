part of '../tracking_order_page.dart';

class TrackingOrderScreen extends StatelessWidget {
  const TrackingOrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.tracking_order,
      ),
      body: ListView(
        children: [
          const _BuildOrderStatus(
            status: OrderStatus.success,
          ),
          const SizedBox(height: Const.space25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: AutoSizeText(
              AppLocalizations.of(context)!.delivery_status,
              style: theme.textTheme.headline3,
            ),
          ),
          const SizedBox(height: Const.space8),
          ListView.builder(
            itemCount: TrackingList.trackingList.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding:const EdgeInsets.symmetric(horizontal: Const.margin),
            itemBuilder: (context, index) {
              final tracking = TrackingList.trackingList[index];
              return _TrackingTimeline(tracking: tracking);
            },
          )
        ],
      ),
    );
  }
}
