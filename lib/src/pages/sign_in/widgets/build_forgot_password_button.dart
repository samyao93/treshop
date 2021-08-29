part of '../sign_in_page.dart';

class _BuildForgotPasswordButton extends StatelessWidget {
  const _BuildForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShakeTransition(
      duration: const Duration(milliseconds: 1200),
      child: Align(
        alignment: Alignment.topRight,
        child: CustomTextButton(
          label: AppLocalizations.of(context)!.forgot_password,
          enableUnderline: true,
          onTap: () =>Get.toNamed<dynamic>(Routes.resetPassword),
        ),
      ),
    );
  }
}
