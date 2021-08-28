part of '../sign_up_page.dart';

class _BuildLoginButton extends StatelessWidget {
  const _BuildLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomFadeTransition(
      duration: const Duration(milliseconds: 800),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              AppLocalizations.of(context)!.already_have_an_account,
              style: theme.textTheme.subtitle1,
            ),
            CustomTextButton(
              label: AppLocalizations.of(context)!.sign_in,
              enableUnderline: true,
              textColor: theme.primaryColor,
              onTap: Get.back,
            )
          ],
        ),
      ),
    );
  }
}
