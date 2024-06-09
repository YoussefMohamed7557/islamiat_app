import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_theme.dart';
import '../providers/app_provider.dart';
import '../tabs/quraan/surah_details.dart';

class SurahNameItem extends StatelessWidget {
  int index;
  String suraName ;
  SurahNameItem(this.index, this.suraName);

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: (){Navigator.pushNamed(context, SurahDetails.routeName,arguments: SurahDetailsArgs(index, suraName));},
      child: Center(
        child: Text("$suraName" ,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 24,color: provider.themeMode==ThemeMode.light?AppTheme.blackColor:Colors.white),
        ),
      ),
    );
  }
}
