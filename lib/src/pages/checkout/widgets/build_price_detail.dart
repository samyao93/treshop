part of '../checkout_page.dart';

class _BuildPriceDetail extends StatelessWidget {
  final String title;
  final int? value;
  final bool isDiscount;

  const _BuildPriceDetail(
      {Key? key, required this.title, this.value, this.isDiscount = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(title, style: theme.textTheme.subtitle1),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: isDiscount ? '- ' : '',
                style: theme.textTheme.headline4,
              ),
              TextSpan(
                text: NumberFormat.currency(
                  symbol: r'$',
                  decimalDigits: 0,
                ).format(value),
                style: theme.textTheme.headline4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
