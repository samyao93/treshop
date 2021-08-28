part of '../sign_in_page.dart';

class _BuildForgotPasswordButton extends StatelessWidget {
  const _BuildForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: CustomTextButton(
        label: AppLocalizations.of(context)!.forgot_password,
        enableUnderline: true,
        onTap: () {},
      ),
    );
  }
}
