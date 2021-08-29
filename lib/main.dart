// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:treshop/l10n/l10n.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/helpers/routes.dart';
import 'package:treshop/src/helpers/themes.dart';
import 'package:treshop/src/providers/authentication_provider.dart';
import 'package:treshop/src/providers/cart_provider.dart';
import 'package:treshop/src/providers/checkout_provider.dart';
import 'package:treshop/src/providers/locale_provider.dart';
import 'package:treshop/src/providers/product_provider.dart';
import 'package:treshop/src/providers/search_provider.dart';
import 'package:treshop/src/providers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => CheckoutProvider()),
      ],
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, theme, locale, snapshot) {
          return GetMaterialApp(
            title: 'Treshop',
            debugShowCheckedModeBanner: false,
            locale: locale.locale,
            theme: themeLight(context),
            darkTheme: themeDark(context),
            themeMode:
                (theme.isLightTheme == true) ? ThemeMode.light : ThemeMode.dark,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: Routes.resetPassword,
            supportedLocales: L10n.all,
            getPages: allRoutes,
          );
        },
      ),
    );
  }
}
