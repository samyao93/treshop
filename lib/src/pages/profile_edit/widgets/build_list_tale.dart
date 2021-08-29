part of '../profile_edit_page.dart';

class _BuildListTale extends StatelessWidget {
  final String label;
  final String text;
  final TextEditingController controller;
  final IconData icon;

  const _BuildListTale({
    Key? key,
    required this.label,
    required this.text,
    required this.controller,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          label,
          style: _theme.textTheme.subtitle1,
        ),
        const SizedBox(height: Const.space8),
      CustomTextFormField(
        controller: controller,
        borderType: BorderType.outline,
        textFieldType: TextFieldType.email,
        hintText: AppLocalizations.of(context)!.email,
        prefixIcon: Icon(
          icon,
          color: _theme.primaryColor,
        ),
      ),
      ],
    );
  }
}
