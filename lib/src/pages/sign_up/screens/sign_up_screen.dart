part of '../sign_up_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController? _usernameController;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  // final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<AuthenticationProvider>(
      builder: (context, provider, snapshot) {
        return Scaffold(
          appBar: CustomAppBar(context),
          body: Form(
            // key: _formKey,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              children: [
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
                      AppLocalizations.of(context)!.or_continue_with_email,
                      style: theme.textTheme.headline4,
                    ),
                    const SizedBox(width: Const.space12),
                    Expanded(child: Divider(color: theme.hintColor)),
                  ],
                ),
                const SizedBox(height: Const.space25),
                CustomTextFormField(
                  controller: _usernameController,
                  borderType: BorderType.outline,
                  textFieldType: TextFieldType.text,
                  hintText: AppLocalizations.of(context)!.username,
                  prefixIcon: Icon(
                    FeatherIcons.user,
                    color: theme.primaryColor,
                  ),
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
                const SizedBox(height: Const.space25),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText('Update Fashion Style',
                          style: theme.textTheme.headline4),
                      const SizedBox(height: Const.space12),
                      Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          children:
                              provider.genderList.asMap().entries.map((e) {
                            return SizedBox(
                              width: 110.0,
                              child: RadioListTile(
                                value: e.value,
                                groupValue: provider.gender,
                                contentPadding: EdgeInsets.zero,
                                activeColor: theme.primaryColor,
                                selectedTileColor: theme.hintColor,
                                onChanged: (String? v) {
                                  provider.gender = v!;
                                },
                                title: AutoSizeText(
                                  e.value,
                                  style: theme.textTheme.subtitle1,
                                ),
                              ),
                            );
                          }).toList())
                    ],
                  ),
                ),
                const SizedBox(height: Const.space12),
                (provider.isLoading)
                    ?const CustomLoadingIndicator()
                    : CustomElevatedButton(
                        onTap: () {
                          // if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          provider.isLoading = true;

                          // ignore: cascade_invocations
                          provider.signUp(
                            context,
                            username: _usernameController!.text,
                            email: _emailController!.text,
                            password: _passwordController!.text,
                          );
                          // }
                        },
                        label: AppLocalizations.of(context)!.sign_up,
                      ),
                const SizedBox(height: Const.space12),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        AppLocalizations.of(context)!.already_have_an_account,
                        style: theme.textTheme.subtitle1,
                      ),
                      CustomTextButton(
                        label: AppLocalizations.of(context)!.sign_in,
                        enableUnderline: true,
                        textColor: theme.primaryColor,
                        onTap: Get.back,
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
