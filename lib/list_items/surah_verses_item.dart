import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_theme.dart';
import '../providers/app_provider.dart';

class SurahVersesItem extends StatelessWidget {
  int index;
  String suraLine;
  SurahVersesItem(this.index, this.suraLine);

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Center(
      child: Text(
        " ${suraLine} (${index + 1})",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: provider.themeMode==ThemeMode.light?AppTheme.blackColor:Colors.white,
        ),
      ),
    );
  }
}
