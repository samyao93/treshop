part of '../sign_up_page.dart';

class _BuildPasswordTextField extends StatelessWidget {
  const _BuildPasswordTextField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _authProv = Provider.of<AuthenticationProvider>(context);

    return CustomShakeTransition(
      duration: const Duration(milliseconds: 1200),
      child: CustomTextFormField(
        controller: passwordController,
        obscureText: _authProv.obscureText,
        borderType: BorderType.outline,
        textFieldType: TextFieldType.password,
        hintText: AppLocalizations.of(context)!.password,
        prefixIcon: Icon(
          FeatherIcons.lock,
          color: _theme.primaryColor,
        ),
        suffixIcon: IconButton(
          icon: Icon((_authProv.obscureText == true)
              ? FeatherIcons.eye
              : FeatherIcons.eyeOff),
          color: _theme.primaryColor,
          onPressed: _authProv.obscureTextChanged,
        ),
      ),
    );
  }
}
