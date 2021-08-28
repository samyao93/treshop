part of '../sign_up_page.dart';

class _BuildDivider extends StatelessWidget {
  const _BuildDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return CustomShakeTransition(
      duration: const Duration(milliseconds: 950),
      child: Row(
        children: [
          Expanded(child: Divider(color: _theme.hintColor)),
          const SizedBox(width: Const.space12),
          AutoSizeText(
            AppLocalizations.of(context)!.or_continue_with_email,
            style: _theme.textTheme.headline4,
          ),
          const SizedBox(width: Const.space12),
          Expanded(child: Divider(color: _theme.hintColor)),
        ],
      ),
    );
  }
}
