import 'package:flutter/material.dart';
import 'package:islamiat/hadith_details.dart';
import '../app_theme.dart';
import '../surah_details.dart';

class HadithNameItem extends StatelessWidget {
  int index;
  String hadithName ;
  HadithNameItem(this.index, this.hadithName);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.pushNamed(context, HadithDetails.routeName,arguments: HadithDetailsArgs(index, hadithName));},
      child: Center(
        child: Text("$hadithName" ,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 24,color: AppTheme.blackColor),
        ),
      ),
    );
  }
}
