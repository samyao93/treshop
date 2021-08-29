part of '../reset_password_success_page.dart';

class ResetPasswordSuccessScreen extends StatelessWidget {
  const ResetPasswordSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          CustomShakeTransition(
            child: SvgPicture.asset(
              Images.resetPasswordEmail,
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(height: Const.space25),
          CustomShakeTransition(
            duration: const Duration(milliseconds: 800),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.check_your_email,
                textAlign: TextAlign.center,
                style: _theme.textTheme.headline3,
              ),
            ),
          ),
          const SizedBox(height: Const.space12),
          CustomShakeTransition(
            duration: const Duration(milliseconds: 850),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!
                    .we_have_sent_a_password_recovery_instruction_to_your_email,
                style: _theme.textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: Const.space25),
          CustomShakeTransition(
            duration: const Duration(milliseconds: 90),
            child: CustomElevatedButton(
              onTap: () {
                Get.toNamed<dynamic>(Routes.newPassword);
              },
              label: AppLocalizations.of(context)!.ok,
            ),
          ),
        ],
      ),
    );
  }
}
