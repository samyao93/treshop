part of '../profile_detail_page.dart';

class _BuildProfileTile extends StatelessWidget {
  final String label;
  final String text;

  const _BuildProfileTile({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          label,
          style: theme.textTheme.subtitle1,
        ),
        const SizedBox(height: Const.space8),
        AutoSizeText(
          text,
          style: theme.textTheme.bodyText2,
        ),
      ],
    );
  }
}
