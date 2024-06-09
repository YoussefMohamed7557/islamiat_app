import 'package:flutter/material.dart';
import 'package:islamiat/providers/app_provider.dart';
import 'package:provider/provider.dart';
import '../app_theme.dart';

class SepratorItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return  Container(
      margin:
      EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      height: 2,
      color: provider.themeMode==ThemeMode.light?AppTheme.lightPrimary:AppTheme.colorGold,
    );
  }
}
