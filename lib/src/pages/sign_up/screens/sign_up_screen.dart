part of '../sign_up_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<AuthenticationProvider>(
      builder: (context, provider, snapshot) {
        return Scaffold(
          appBar: CustomAppBar(context),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            children: [
              const _BuildLogo(),
              const SizedBox(height: Const.space25),
              const _BuildSocialButton(),
              const SizedBox(height: Const.space25),
              const _BuildDivider(),
              const SizedBox(height: Const.space25),
              _BuildUsernameTextField(usernameController: _usernameController),
              const SizedBox(height: Const.space25),
              _BuildEmailTextField(emailController: _emailController),
              const SizedBox(height: Const.space25),
              _BuildPasswordTextField(passwordController: _passwordController),
              const SizedBox(height: Const.space25),
              const _BuildGenderRadioButton(),
              const SizedBox(height: Const.space12),
              if (provider.isLoading)
                const CustomLoadingIndicator()
              else
                _BuildRegisterButton(
                  usernameController: _usernameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              const SizedBox(height: Const.space12),
              const _BuildLoginButton()
            ],
          ),
        );
      },
    );
  }
}

