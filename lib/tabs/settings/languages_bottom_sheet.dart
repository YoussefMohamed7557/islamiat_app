import 'package:flutter/material.dart';
import 'package:islamiat/app_theme.dart';
import 'package:islamiat/providers/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguagesBottomSheetWidget extends StatefulWidget {
  const LanguagesBottomSheetWidget({super.key});

  @override
  State<LanguagesBottomSheetWidget> createState() =>
      _LanguagesBottomSheetWidgetState();
}

class _LanguagesBottomSheetWidgetState
    extends State<LanguagesBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    bool isArabicCondition = provider.language_code == "ar";
    bool isEnglishCondition = provider.language_code == "en";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              provider.changeLanguageCode("en");
              Navigator.pop(context);
            },
            child: getLanguageRow(
                isEnglishCondition, AppLocalizations.of(context)!.english)),
        InkWell(
            onTap: () {
              provider.changeLanguageCode("ar");
              Navigator.pop(context);
            },
            child: getLanguageRow(
                isArabicCondition, AppLocalizations.of(context)!.arabic))
      ],
    );
  }

  Widget getLanguageRow(bool isSelected, String text) {
    Widget row;
    if (isSelected) {
      row = Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
            Icon(
              Icons.check,
              color: AppTheme.lightPrimary,
            )
          ],
        ),
      );
    } else {
      row = Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      );
    }
    return row;
  }
}
