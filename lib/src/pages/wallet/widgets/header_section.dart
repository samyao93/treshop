part of '../wallet_page.dart';

class _HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: Screens.width(context),
      height: 201,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 100,
            child: Container(
              color: theme.primaryColor,
            ),
          ),
          Positioned(
            top: Const.margin,
            left: Const.margin,
            right: Const.margin,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Const.margin),
                color: theme.cardColor,
              ),
              padding: const EdgeInsets.all(Const.margin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AutoSizeText(
                            DateFormat.EEEE().format(DateTime.now()),
                            style: theme.textTheme.bodyText2,
                          ),
                          AutoSizeText(
                            DateFormat.yMMMMd().format(DateTime.now()),
                            style: theme.textTheme.bodyText2,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AutoSizeText(
                            NumberFormat.currency(
                    symbol: r'$',
                     decimalDigits: 0,).format(2500),
                            style: theme.textTheme.headline3,
                          ),
                          AutoSizeText(
                            'TRESHOP Balance',
                            style: theme.textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: Const.space8),
                  Divider(color: theme.hintColor),
                  const SizedBox(height: Const.space8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: Color(0xFFA872B1),
                            child: Icon(
                              FeatherIcons.plus,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(height: 5),
                          AutoSizeText(
                            AppLocalizations.of(context)!.top_up,
                            style: theme.textTheme.bodyText2,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: Color(0xFF6D9BE1),
                            child: Icon(
                              FeatherIcons.creditCard,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(height: 5),
                          AutoSizeText(
                            AppLocalizations.of(context)!.pay,
                            style: theme.textTheme.bodyText2,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: Color(0xFFFBB630),
                            child: Icon(
                              FeatherIcons.refreshCcw,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(height: 5),
                          AutoSizeText(
                            AppLocalizations.of(context)!.transfer,
                            style: theme.textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
