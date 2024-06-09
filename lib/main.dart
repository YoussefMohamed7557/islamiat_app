import 'package:flutter/material.dart';
import 'package:islamiat/app_theme.dart';
import 'package:islamiat/tabs/hadeth/hadith_details.dart';
import 'package:islamiat/home_screen.dart';
import 'package:islamiat/providers/app_provider.dart';
import 'package:islamiat/tabs/quraan/surah_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (BuildContext context) { return AppProvider(); },
      child: MyApp())
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates:  [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.language_code),
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName : (context)=> HomeScreen(),
        SurahDetails.routeName : (context) => SurahDetails(),
        HadithDetails.routeName : (context) => HadithDetails()
      },
      theme: AppTheme.lightTheme,
    );
  }
}
