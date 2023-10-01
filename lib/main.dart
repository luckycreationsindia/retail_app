import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:retail_app/src/utils/custom_theme.dart';
import 'package:retail_app/src/utils/isar_service.dart';
import 'package:retail_app/src/utils/router.dart';
import 'package:retail_app/src/utils/globals.dart' as globals;

import 'l10n/l10n.dart';

void main() async {
  await initMainData();
  runApp(const MyApp());
}

Future<void> initMainData() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  globals.appPath = (await getApplicationDocumentsDirectory()).path;
  await IsarService().openDB();

  final settings = await IsarService().getSettings();
  //Set Default Language
  Intl.defaultLocale = settings.lang;
  //Error Handling
  FlutterError.onError = (details) {
    if (kDebugMode) {
      print(details);
    }
    // print(details.exceptionAsString(), stackTrace: details.stack);
  };
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