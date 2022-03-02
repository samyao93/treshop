part of '../sign_up_page.dart';

class _BuildRegisterButton extends StatelessWidget {
  const _BuildRegisterButton({
    Key? key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final _authProv = Provider.of<AuthenticationProvider>(context);

    return CustomFadeTransition(
      duration: const Duration(milliseconds: 700),
      child: CustomElevatedButton(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _authProv.isLoading = true;
          // ignore: cascade_invocations
          _authProv.signUp(
            context,
            username: usernameController.text,
            email: emailController.text,
            password: passwordController.text,
          );
        },
        label: AppLocalizations.of(context)!.sign_up,
      ),
    );
  }
}
