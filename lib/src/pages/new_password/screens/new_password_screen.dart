part of '../new_password_page.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late TextEditingController _passwordController;
  late TextEditingController _passwordConfirmationController;
  bool _isLoading = false;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController(text: '');
    _passwordConfirmationController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        context,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          CustomShakeTransition(
            child: SvgPicture.asset(
              Images.resetPasswordOTP,
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(height: Const.space25),
          CustomShakeTransition(
            duration: const Duration(milliseconds: 800),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.create_new_password,
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
                    .your_new_password_must_be_different_from_previously_used_passwords,
                style: _theme.textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: Const.space15),
          CustomShakeTransition(
            duration: const Duration(milliseconds: 900),
            child: CustomTextFormField(
              obscureText: _obscureText,
              controller: _passwordController,
              borderType: BorderType.outline,
              textFieldType: TextFieldType.password,
              hintText: AppLocalizations.of(context)!.password,
              prefixIcon: Icon(
                FeatherIcons.lock,
                color: _theme.primaryColor,
              ),
              suffixIcon: IconButton(
                icon: Icon((_obscureText == true)
                    ? FeatherIcons.eye
                    : FeatherIcons.eyeOff),
                color: _theme.primaryColor,
                onPressed: () {
                  setState(() => _obscureText = !_obscureText);
                },
              ),
            ),
          ),
          const SizedBox(height: Const.space12),
          CustomShakeTransition(
            duration: const Duration(milliseconds: 900),
            child: CustomTextFormField(
              obscureText: _obscureText,
              controller: _passwordConfirmationController,
              borderType: BorderType.outline,
              textFieldType: TextFieldType.password,
              hintText: AppLocalizations.of(context)!.confirm_password,
              prefixIcon: Icon(
                FeatherIcons.lock,
                color: _theme.primaryColor,
              ),
              suffixIcon: IconButton(
                icon: Icon((_obscureText == true)
                    ? FeatherIcons.eye
                    : FeatherIcons.eyeOff),
                color: _theme.primaryColor,
                onPressed: () {
                  setState(() => _obscureText = !_obscureText);
                },
              ),
            ),
          ),
          const SizedBox(height: Const.space25),
          CustomShakeTransition(
            duration: const Duration(milliseconds: 1000),
            child: CustomElevatedButton(
              onTap: () {
                setState(() => _isLoading = true);
                Future.delayed(const Duration(seconds: 3), () {
                  setState(() => _isLoading = false);
                  Get.offAllNamed<dynamic>(Routes.signIn);
                });
              },
              label: AppLocalizations.of(context)!.done,
              isLoading: _isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
