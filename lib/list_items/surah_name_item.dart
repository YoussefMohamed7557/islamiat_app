import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../surah_details.dart';

class SurahNameItem extends StatelessWidget {
  int index;
  String suraName ;
  SurahNameItem(this.index, this.suraName);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.pushNamed(context, SurahDetails.routeName,arguments: SurahDetailsArgs(index, suraName));},
      child: Center(
        child: Text("$suraName" ,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 24,color: AppTheme.blackColor),
        ),
      ),
    );
  }
}
