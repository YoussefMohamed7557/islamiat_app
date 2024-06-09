import 'package:flutter/material.dart';
import 'package:islamiat/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiat/tabs/settings/languages_bottom_sheet.dart';
import 'package:islamiat/providers/app_provider.dart';
import 'package:islamiat/tabs/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTap extends StatefulWidget {
  const SettingsTap({super.key});

  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    String selectedLanguage = provider.language_code=="en"?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic;
    String selectedThemeMode = provider.themeMode==ThemeMode.light?AppLocalizations.of(context)!.light_mode:AppLocalizations.of(context)!.dark_mode;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.headline1,),
          InkWell(
            onTap: (){
              showLanguageBottomSheet();
            },
            child: Container(
              child: Text(selectedLanguage, style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300),),
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: Theme.of(context).primaryColor)),
            ),
          ),
          Text(AppLocalizations.of(context)!.theme,style: Theme.of(context).textTheme.headline1,),
          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
              child: Text(selectedThemeMode, style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300),),
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: Theme.of(context).primaryColor)),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext) => LanguagesBottomSheetWidget());
  }
  void showThemeBottomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext) => ThemeBottomSheetWidget());
  }
}
