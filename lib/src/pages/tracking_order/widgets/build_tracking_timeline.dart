part of '../tracking_order_page.dart';


class _TrackingTimeline extends StatelessWidget {
  final TrackingModel tracking;

  const _TrackingTimeline({Key? key, required this.tracking}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: Screens.width(context),
      height: 70.0,
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 10.0,
                backgroundColor: theme.primaryColor,
              ),
              Container(
                width: 2.0,
                height: 50.0,
                color: theme.hintColor,
              ),
            ],
          ),
          SizedBox(width: Const.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        tracking.title!,
                        style: theme.textTheme.subtitle1,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: Const.space8),
                    AutoSizeText(DateFormat.yMMMMd().format(DateTime.now()),
                        style: theme.textTheme.subtitle2),
                  ],
                ),
                SizedBox(height: Const.space8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        tracking.subtitle!,
                        style: theme.textTheme.headline4,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: Const.space8),
                    AutoSizeText(
                      DateFormat('hh:mm').format(tracking.date!),
                      style: theme.textTheme.subtitle2,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
