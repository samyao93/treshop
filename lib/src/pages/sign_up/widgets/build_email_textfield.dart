part of '../sign_up_page.dart';

class _BuildEmailTextField extends StatelessWidget {
  const _BuildEmailTextField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return CustomShakeTransition(
      duration: const Duration(milliseconds: 1100),
      child: CustomTextFormField(
        controller: emailController,
        borderType: BorderType.outline,
        textFieldType: TextFieldType.email,
        hintText: AppLocalizations.of(context)!.email,
        prefixIcon: Icon(
          FeatherIcons.mail,
          color: _theme.primaryColor,
        ),
      ),
    );
  }
}
