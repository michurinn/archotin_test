import 'package:archonit_test/shared/extensions/theme_extensions/theme_text_styles.dart';
import 'package:archonit_test/src/app_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(extensions: [ThemeTextStyles.light()]),
      routerDelegate: AppRouterDelegate(),
      routeInformationParser: AppRouteInformationParser(),
      darkTheme: ThemeData.dark(),
    );
  }
}
