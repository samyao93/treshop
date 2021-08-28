part of '../sign_in_page.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          const SizedBox(height: 50),
          SvgPicture.asset(
            CustomIcon.logo,
            width: Screens.width(context) / 10,
            height: Screens.width(context) / 10,
          ),
          const SizedBox(height: Const.space25),
          const _BuildSocialButton(),
          const SizedBox(height: Const.space25),
          const _BuildDivider(),
          const SizedBox(height: Const.space25),
          _BuildEmailTextField(emailController: _emailController),
          const SizedBox(height: Const.space25),
          _BuildPasswordTextField(
            passwordController: _passwordController,
          ),
          const SizedBox(height: Const.space12),
          const _BuildForgotPasswordButton(),
          const SizedBox(height: Const.space12),
          if (_authProvider.isLoading)
            const CustomLoadingIndicator()
          else
            _BuildSignInButton(
              emailController: _emailController,
              passwordController: _passwordController,
            ),
          const SizedBox(height: Const.space12),
          const _BuildRegisterButton()
        ],
      ),
    );
  }
}
