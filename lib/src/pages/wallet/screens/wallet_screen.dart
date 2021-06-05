part of '../wallet_page.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            FeatherIcons.arrowLeft,
          ),
          color: Colors.white,
        ),
        title: AutoSizeText(
          AppLocalizations.of(context)!.wallet,
          style: theme.textTheme.headline3!.copyWith(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: [
          _HeaderSection(),
          SizedBox(height: Const.space25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: AutoSizeText(
              AppLocalizations.of(context)!.recent_transaction,
              style: theme.textTheme.headline3,
            ),
          ),
          SizedBox(height: Const.space8),
          ListView.builder(
            itemCount: TransactionList.transactionList.length,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var transaction = TransactionList.transactionList[index];
              return TransactionCard(transaction: transaction);
            },
          )
        ],
      ),
    );
  }
}
