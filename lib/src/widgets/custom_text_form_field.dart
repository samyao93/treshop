import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:treshop/src/helpers/colors.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/providers/theme_provider.dart';
 

enum TextFieldType { alphabet, email, text, password, phoneNumber, number }
enum BorderType { outline, underline, none }

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextFieldType textFieldType;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final BorderType borderType;
  final int? maxLines;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.textFieldType = TextFieldType.text,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.borderType = BorderType.none,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mode = Provider.of<ThemeProvider>(context);

    final alphabetValidator = MultiValidator([
      RequiredValidator(
          errorText: AppLocalizations.of(context)!.please_enter_a_value),
      PatternValidator(r'^[A-Za-z_ .,]+$',
          errorText: AppLocalizations.of(context)!.only_characters_are_allowed),
    ]);

    final emailValidator = MultiValidator([
      RequiredValidator(
        errorText:
            AppLocalizations.of(context)!.please_enter_your_email_address,
      ),
      EmailValidator(
          errorText: AppLocalizations.of(context)!.invalid_email_address_format)
    ]);

    final passwordValidator = MultiValidator([
      RequiredValidator(
          errorText: AppLocalizations.of(context)!.please_enter_your_password),
      MinLengthValidator(6,
          errorText: AppLocalizations.of(context)!.invalid_password_format)
    ]);

    final phoneNumberValidator = MultiValidator([
      RequiredValidator(
          errorText:
              AppLocalizations.of(context)!.please_enter_your_phone_number),
      MinLengthValidator(10,
          errorText: AppLocalizations.of(context)!.invalid_phone_number_format),
      PatternValidator(r'^[0-9]+$',
          errorText: AppLocalizations.of(context)!.invalid_phone_number_format),
    ]);

    final textValidator = MultiValidator([
      RequiredValidator(
          errorText: AppLocalizations.of(context)!.please_enter_a_value),
      MinLengthValidator(1,
          errorText: AppLocalizations.of(context)!.data_is_too_short),
    ]);

    final numberValidator = MultiValidator([
      RequiredValidator(
          errorText: AppLocalizations.of(context)!.please_enter_a_value),
      MinLengthValidator(1,
          errorText: AppLocalizations.of(context)!.data_is_too_short),
      PatternValidator(r'^[0-9]+$',
          errorText: AppLocalizations.of(context)!.invalid_number_format),
    ]);

    TextInputType _keyboardType(TextFieldType textFieldType) {
      switch (textFieldType) {
        case TextFieldType.alphabet:
          return TextInputType.text;
        case TextFieldType.email:
          return TextInputType.emailAddress;
        case TextFieldType.number:
          return TextInputType.number;
        case TextFieldType.password:
          return TextInputType.text;
        case TextFieldType.phoneNumber:
          return TextInputType.phone;
        case TextFieldType.text:
          return TextInputType.text;
        default:
          return TextInputType.text;
      }
    }

    MultiValidator _validator(TextFieldType textFieldType) {
      switch (textFieldType) {
        case TextFieldType.alphabet:
          return alphabetValidator;
        case TextFieldType.email:
          return emailValidator;
        case TextFieldType.number:
          return numberValidator;
        case TextFieldType.password:
          return passwordValidator;
        case TextFieldType.phoneNumber:
          return phoneNumberValidator;
        case TextFieldType.text:
          return textValidator;
        default:
          return textValidator;
      }
    }

    InputBorder _enabledBorder(BorderType borderType) {
      switch (borderType) {
        case BorderType.underline:
          return UnderlineInputBorder(
            borderSide: BorderSide(
              color: theme.disabledColor,
            ),
          );
        case BorderType.outline:
          return OutlineInputBorder(
            borderRadius: BorderRadius.circular(Const.radius),
            borderSide: BorderSide(
              color: theme.disabledColor,
            ),
          );
        case BorderType.none:
          return InputBorder.none;

        default:
          return InputBorder.none;
      }
    }

    InputBorder _focusedBorder(BorderType borderType) {
      switch (borderType) {
        case BorderType.underline:
          return UnderlineInputBorder(
            borderSide: BorderSide(
              color: (mode.isLightTheme != true)
                  ? ColorDark.success
                  : ColorLight.success,
            ),
          );
        case BorderType.outline:
          return OutlineInputBorder(
            borderRadius: BorderRadius.circular(Const.radius),
            borderSide: BorderSide(
              color: (mode.isLightTheme != true)
                  ? ColorDark.success
                  : ColorLight.success,
            ),
          );
        case BorderType.none:
          return InputBorder.none;

        default:
          return InputBorder.none;
      }
    }

    InputBorder _errorBorder(BorderType borderType) {
      switch (borderType) {
        case BorderType.underline:
          return UnderlineInputBorder(
            borderSide: BorderSide(
              color: theme.errorColor,
            ),
          );
        case BorderType.outline:
          return OutlineInputBorder(
            borderRadius: BorderRadius.circular(Const.radius),
            borderSide: BorderSide(
              color: theme.errorColor,
            ),
          );
        case BorderType.none:
          return InputBorder.none;
        default:
          return InputBorder.none;
      }
    }

    EdgeInsets _contentPadding(BorderType borderType) {
      switch (borderType) {
        case BorderType.underline:
          return  EdgeInsets.zero;
        case BorderType.outline:
          return const EdgeInsets.symmetric(horizontal: Const.margin);
        case BorderType.none:
          return const EdgeInsets.only(top: 15);
        default:
          return const EdgeInsets.symmetric(horizontal: Const.margin);
      }
    }

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      enabled: enabled,
      textAlign: textAlign ?? TextAlign.left,
      obscureText: obscureText ?? false,
      style: theme.textTheme.bodyText1,
      keyboardType: _keyboardType(textFieldType),
      validator: _validator(textFieldType),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.subtitle1,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: (suffixIcon == null)
            ? _contentPadding(borderType)
            : const EdgeInsets.only(
                left: Const.margin,
                top: 12,
              ),
        enabledBorder: _enabledBorder(borderType),
        focusedBorder: _focusedBorder(borderType),
        errorBorder: _errorBorder(borderType),
        focusedErrorBorder: _errorBorder(borderType),
      ),
    );
  }
}
