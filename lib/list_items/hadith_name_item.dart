import 'package:flutter/material.dart';
import 'package:islamiat/tabs/hadeth/hadith_details.dart';
import 'package:provider/provider.dart';
import '../app_theme.dart';
import '../providers/app_provider.dart';
import '../tabs/quraan/surah_details.dart';

class HadithNameItem extends StatelessWidget {
  int index;
  String hadithName ;
  HadithNameItem(this.index, this.hadithName);

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: (){Navigator.pushNamed(context, HadithDetails.routeName,arguments: HadithDetailsArgs(index, hadithName));},
      child: Center(
        child: Text("$hadithName" ,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 24,color: provider.themeMode==ThemeMode.light?AppTheme.blackColor:Colors.white),
        ),
      ),
    );
  }
}
