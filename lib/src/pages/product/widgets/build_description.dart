part of '../product_page.dart';

class _BuildDescription extends StatelessWidget {
  const _BuildDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: ReadMoreText(
        product.description!,
        style: theme.textTheme.subtitle1,
        trimMode: TrimMode.Line,
        trimLines: 5,
        trimCollapsedText: AppLocalizations.of(context)!.read_more,
        trimExpandedText: AppLocalizations.of(context)!.show_less,
        lessStyle: theme.textTheme.bodyText2!.copyWith(
          color: theme.primaryColor,
        ),
        moreStyle: theme.textTheme.bodyText2!.copyWith(
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
