part of '../sign_up_page.dart';

class _BuildUsernameTextField extends StatelessWidget {
  const _BuildUsernameTextField({
    Key? key,
    required this.usernameController,
  }) : super(key: key);

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return CustomShakeTransition(
      duration: const Duration(milliseconds: 1000),
      child: CustomTextFormField(
        controller: usernameController,
        borderType: BorderType.outline,
        hintText: AppLocalizations.of(context)!.username,
        prefixIcon: Icon(
          FeatherIcons.mail,
          color: _theme.primaryColor,
        ),
      ),
    );
  }
}
