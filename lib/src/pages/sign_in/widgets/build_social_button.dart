part of '../sign_in_page.dart';

class _BuildSocialButton extends StatelessWidget {
  const _BuildSocialButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSocialButton(
          label: AppLocalizations.of(context)!.connect_with_apple_id,
          onTap: () => showToast(
            msg: AppLocalizations.of(context)!.apple_sign_in_clicked,
          ),
          icon: CustomIcon.apple,
        ),
        const SizedBox(height: Const.space15),
        CustomSocialButton(
          label: AppLocalizations.of(context)!.connect_with_google,
          onTap: () => showToast(
            msg: AppLocalizations.of(context)!.google_sign_in_clicked,
          ),
          icon: CustomIcon.google,
        ),
        const SizedBox(height: Const.space15),
        CustomSocialButton(
          label: AppLocalizations.of(context)!.connect_with_facebook,
          onTap: () => showToast(
            msg: AppLocalizations.of(context)!.facebook_sign_in_clicked,
          ),
          icon: CustomIcon.facebook,
        ),
      ],
    );
  }
}
