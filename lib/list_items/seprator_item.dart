import 'package:flutter/material.dart';
import '../app_theme.dart';

class SepratorItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:
      EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      height: 2,
      color: AppTheme.lightPrimary,
    );
  }
}
