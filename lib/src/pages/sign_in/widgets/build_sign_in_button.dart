part of '../sign_in_page.dart';

class _BuildSignInButton extends StatelessWidget {
  const _BuildSignInButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthenticationProvider>(context);
    return CustomFadeTransition(
      duration: const Duration(milliseconds: 700),
      child: CustomElevatedButton(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _authProvider.isLoading = true;
          // ignore: cascade_invocations
          _authProvider.signIn(
            context,
            email: emailController.text,
            password: passwordController.text,
          );
        },
        label: AppLocalizations.of(context)!.sign_in,
      ),
    );
  }
}
