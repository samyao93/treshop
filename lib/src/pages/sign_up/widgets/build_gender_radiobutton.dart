part of '../sign_up_page.dart';


class _BuildGenderRadioButton extends StatelessWidget {
  const _BuildGenderRadioButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _authProv = Provider.of<AuthenticationProvider>(context);

    return CustomShakeTransition(
      duration: const Duration(milliseconds: 1300),
      child: Align(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoSizeText(
              AppLocalizations.of(context)!.gender,
              style: _theme.textTheme.headline4,
            ),
            const SizedBox(height: Const.space8),
            Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: _authProv.genderList.asMap().entries.map((e) {
                  return SizedBox(
                    width: 110,
                    child: RadioListTile<String>(
                      value: e.value,
                      groupValue: _authProv.gender,
                      contentPadding: EdgeInsets.zero,
                      activeColor: _theme.primaryColor,
                      selectedTileColor: _theme.hintColor,
                      onChanged: (String? v) {
                        _authProv.gender = v!;
                      },
                      title: AutoSizeText(
                        e.value,
                        style: _theme.textTheme.subtitle1,
                      ),
                    ),
                  );
                }).toList())
          ],
        ),
      ),
    );
  }
}
