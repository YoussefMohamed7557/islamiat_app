import 'package:flutter/material.dart';
import 'package:islamiat/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiat/tabs/settings/languages_bottom_sheet.dart';
import 'package:islamiat/providers/app_provider.dart';
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
              child: Text(provider.language_code=="en"?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic, style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300),),
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: AppTheme.lightPrimary)),
            ),
          ),
          Text(AppLocalizations.of(context)!.theme,style: Theme.of(context).textTheme.headline1,),
          InkWell(
            onTap: (){
              showLanguageBottomSheet();
            },
            child: Container(
              child: Text(AppLocalizations.of(context)!.light_mode, style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300),),
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: AppTheme.lightPrimary)),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext) => LanguagesBottomSheetWidget());
  }
}
