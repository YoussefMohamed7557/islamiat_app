import 'package:flutter/material.dart';
import 'package:islamiat/app_theme.dart';
import 'package:islamiat/providers/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheetWidget extends StatefulWidget {
  const ThemeBottomSheetWidget({super.key});

  @override
  State<ThemeBottomSheetWidget> createState() => _ThemeBottomSheetWidgetState();
}

class _ThemeBottomSheetWidgetState extends State<ThemeBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    bool isLightCondition = provider.themeMode == ThemeMode.light;
    bool isDarkCondition = provider.themeMode == ThemeMode.dark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              provider.changeThemeMode(ThemeMode.light);
              Navigator.pop(context);
            },
            child: getThemeRow(
                isLightCondition, AppLocalizations.of(context)!.light_mode)),
        InkWell(
            onTap: () {
              provider.changeThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: getThemeRow(
                isDarkCondition, AppLocalizations.of(context)!.dark_mode))
      ],
    );
  }

  Widget getThemeRow(bool isSelected, String text) {
    Widget row;
    if (isSelected) {
      row = Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                    )),
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
