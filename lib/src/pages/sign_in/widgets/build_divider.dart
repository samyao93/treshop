part of '../sign_in_page.dart';

class _BuildDivider extends StatelessWidget {
  const _BuildDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Row(
      children: [
        Expanded(child: Divider(color: _theme.hintColor)),
        const SizedBox(width: Const.space12),
        AutoSizeText(
          AppLocalizations.of(context)!.or_login_with_email,
          style: _theme.textTheme.headline4,
        ),
        const SizedBox(width: Const.space12),
        Expanded(child: Divider(color: _theme.hintColor)),
      ],
    );
  }
}
