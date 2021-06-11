// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:treshop/src/helpers/themes.dart';
import 'package:treshop/src/providers/authentication_provider.dart';
import 'package:treshop/src/providers/cart_provider.dart';
import 'package:treshop/src/providers/checkout_provider.dart';
import 'package:treshop/src/providers/product_provider.dart';
import 'package:treshop/src/providers/search_provider.dart';

import 'l10n/l10n.dart';
import 'src/helpers/constants.dart';
import 'src/helpers/routes.dart';
import 'src/providers/locale_provider.dart';
import 'src/providers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
            title: 'Furney',
            locale: locale.locale,
            theme: themeLight(context),
            darkTheme: themeDark(context),
            themeMode:
                (theme.isLightTheme == true) ? ThemeMode.light : ThemeMode.dark,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: Routes.splash,
            supportedLocales: L10n.all,
            getPages: allRoutes,
          );
        },
      ),
    );
  }
}
