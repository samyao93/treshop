part of '../language_page.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Text _title(String val) {
       switch (val) {
        case 'en':
          return Text('English', style: theme.textTheme.bodyText2);
        case 'id':
          return Text('Bahasa Indonesia', style: theme.textTheme.bodyText2);
        case 'hi':
          return Text('भारतीय भाषाएं', style: theme.textTheme.bodyText2);
        case 'ar':
          return Text('عربي', style: theme.textTheme.bodyText2);
        default:
          return Text('English', style: theme.textTheme.bodyText2);
      }
    }

    return Consumer<LocaleProvider>(builder: (context, locale, snapshot) {
      final lang = locale.locale ?? Localizations.localeOf(context);

      return Scaffold(
        appBar: CustomAppBar(
          context,
          title: AppLocalizations.of(context)!.change_language,
        ),
        body: Card(
          elevation: 6,
          margin: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.space8),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: lang,
                iconSize: 24,
                elevation: 16,
                dropdownColor: theme.cardColor,
                isExpanded: true,
                style: theme.textTheme.bodyText2,
                onChanged: (Locale? newValue) {
                  locale.setLocale(newValue!);
                },
                items: L10n.all.map((v) {
                  return DropdownMenuItem(
                    value: v,
                    child: _title(v.languageCode),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      );
    });
  }
}
