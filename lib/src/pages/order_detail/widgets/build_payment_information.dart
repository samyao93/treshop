part of '../order_detail_page.dart';

class _BuildPaymentInformation extends StatelessWidget {
  final String? label;
  final String? trailing;
  final int? value;
  final bool isTotal;
  final bool isDiscount;

  const _BuildPaymentInformation({
    Key? key,
    this.label,
    this.trailing,
    this.value,
    this.isTotal = false,
    this.isDiscount = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          label!,
          style: (isTotal == true)
              ? theme.textTheme.bodyText1!
              : theme.textTheme.subtitle1,
        ),
        AutoSizeText(
          (value == null)
              ? trailing!
              : (isDiscount == true)
                  ? '-${NumberFormat.currency(
                      symbol: r'$',
                      decimalDigits: 0,
                    ).format(value)}'
                  : NumberFormat.currency(
                      symbol: r'$',
                      decimalDigits: 0,
                    ).format(value),
          style: theme.textTheme.headline3,
        ),
      ],
    );
  }
}
