import 'package:flutter/material.dart';
import '../app_theme.dart';

class SurahVersesItem extends StatelessWidget {
  int index;
  String suraLine;
  SurahVersesItem(this.index, this.suraLine);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        " ${suraLine} (${index + 1})",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: AppTheme.blackColor,
        ),
      ),
    );
  }
}
