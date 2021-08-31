part of '../address_page.dart';


class _BuildListTile extends StatelessWidget {
  final IconData icon;
  final String value;

  const _BuildListTile({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: _theme.primaryColor,
        ),
        const SizedBox(width: Const.space8),
        Expanded(
          child: Text(
            value,
            style: _theme.textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
