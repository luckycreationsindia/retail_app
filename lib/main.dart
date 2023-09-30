import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:retail_app/src/models/settings.dart';
import 'package:retail_app/src/utils/custom_theme.dart';
import 'package:retail_app/src/utils/isar_service.dart';
import 'package:retail_app/src/utils/router.dart';
import 'package:retail_app/src/utils/globals.dart' as globals;

import 'l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  globals.appPath = (await getApplicationDocumentsDirectory()).path;

  final settings = (await IsarService().db).settings.where().findFirst();
  //Set Default Language
  Intl.defaultLocale = settings?.lang ?? "en";
  //Error Handling
  FlutterError.onError = (details) {
    if (kDebugMode) {
      print(details);
    }
    // print(details.exceptionAsString(), stackTrace: details.stack);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Intl.defaultLocale!),
      onGenerateTitle: (context) => context.l10n.appTitle,
      theme: customTheme(context),
    );
  }
}