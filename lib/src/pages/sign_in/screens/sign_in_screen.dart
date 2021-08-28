part of '../sign_in_page.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  // final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<AuthenticationProvider>(
      builder: (context, provider, snapshot) {
        return Scaffold(
          body: Form(
            // key: _formKey,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              children: [
                const SizedBox(height: 50),
                SvgPicture.asset(
                  CustomIcon.logo,
                  width: Screens.width(context) / 10,
                  height: Screens.width(context) / 10,
                ),
                const SizedBox(height: Const.space25),
                CustomSocialButton(
                  label: AppLocalizations.of(context)!.connect_with_apple_id,
                  onTap: () {},
                  icon: CustomIcon.apple,
                ),
                const SizedBox(height: Const.space15),
                CustomSocialButton(
                  label: AppLocalizations.of(context)!.connect_with_google,
                  onTap: () {},
                  icon: CustomIcon.google,
                ),
                const SizedBox(height: Const.space15),
                CustomSocialButton(
                  label: AppLocalizations.of(context)!.connect_with_facebook,
                  onTap: () {},
                  icon: CustomIcon.facebook,
                ),
                const SizedBox(height: Const.space25),
                Row(
                  children: [
                    Expanded(child: Divider(color: theme.hintColor)),
                    const SizedBox(width: Const.space12),
                    AutoSizeText(
                      AppLocalizations.of(context)!.or_login_with_email,
                      style: theme.textTheme.headline4,
                    ),
                    const SizedBox(width: Const.space12),
                    Expanded(child: Divider(color: theme.hintColor)),
                  ],
                ),
                const SizedBox(height: Const.space25),
                CustomTextFormField(
                  controller: _emailController,
                  borderType: BorderType.outline,
                  textFieldType: TextFieldType.email,
                  hintText: AppLocalizations.of(context)!.email,
                  prefixIcon: Icon(
                    FeatherIcons.mail,
                    color: theme.primaryColor,
                  ),
                ),
                const SizedBox(height: Const.space25),
                CustomTextFormField(
                  controller: _passwordController,
                  obscureText: provider.obscureText,
                  borderType: BorderType.outline,
                  textFieldType: TextFieldType.password,
                  hintText: AppLocalizations.of(context)!.password,
                  prefixIcon: Icon(
                    FeatherIcons.lock,
                    color: theme.primaryColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon((provider.obscureText == true)
                        ? FeatherIcons.eye
                        : FeatherIcons.eyeOff),
                    color: theme.primaryColor,
                    onPressed: () => provider.obscureTextChanged(),
                  ),
                ),
                const SizedBox(height: Const.space12),
                Align(
                  alignment: Alignment.topRight,
                  child: CustomTextButton(
                    label: AppLocalizations.of(context)!.forgot_password,
                    enableUnderline: true,
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: Const.space12),
                if (provider.isLoading)
                  const CustomLoadingIndicator()
                else
                  CustomElevatedButton(
                    onTap: () {
                      // if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      provider.isLoading = true;

                      // ignore: cascade_invocations
                      provider.signIn(
                        context,
                        email: _emailController!.text,
                        password: _passwordController!.text,
                      );
                      // }
                    },
                    label: AppLocalizations.of(context)!.sign_in,
                  ),
                const SizedBox(height: Const.space12),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        AppLocalizations.of(context)!.dont_have_an_account,
                        style: theme.textTheme.subtitle1,
                      ),
                      CustomTextButton(
                        label: AppLocalizations.of(context)!.register,
                        enableUnderline: true,
                        textColor: theme.primaryColor,
                        onTap: () => Get.toNamed<dynamic>(Routes.signUp),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
