import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:treshop/src/models/transaction_model.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    IconData _iconType(TransactionType val) {
      switch (val) {
        case TransactionType.pay:
          return FeatherIcons.upload;
        case TransactionType.topUp:
          return FeatherIcons.download;
        case TransactionType.transfer:
          return FeatherIcons.refreshCcw;
        default:
          return FeatherIcons.gift;
      }
    }

    Color _iconColorType(TransactionType val) {
      switch (val) {
        case TransactionType.pay:
          return const Color(0xFFFA1F1F);
        case TransactionType.topUp:
          return const Color(0xFF56E289);
        case TransactionType.transfer:
          return const Color(0xFFFA1F1F);
        default:
          return const Color(0xFFFA1F1F);
      }
    }

    return ListTile(
      leading: CircleAvatar(
        radius: 22.0,
        backgroundColor: _iconColorType(transaction.type!).withOpacity(.2),
        child: Icon(
          _iconType(transaction.type!),
          color: _iconColorType(transaction.type!),
          size: 20.0,
        ),
      ),
      title: AutoSizeText(
        transaction.title!,
        maxLines: 1,
        style: theme.textTheme.headline3,
      ),
      subtitle: AutoSizeText(
        DateFormat('dd MMM, hh:mm').format(transaction.date!),
        style: theme.textTheme.subtitle2,
      ),
      trailing: AutoSizeText(
        NumberFormat.currency(symbol: '\$').format(200),
        style: theme.textTheme.headline3,
      ),
    );
  }
}
