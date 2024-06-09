import 'package:flutter/material.dart';
import 'package:islamiat/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';

class TasbehTap extends StatefulWidget {
  @override
  State<TasbehTap> createState() => _TasbehTapState();
}

class _TasbehTapState extends State<TasbehTap> {
  int counter = 0;
  int currentTasbeh = 0;

  List<String> tasbihList = [];

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    tasbihList = [AppLocalizations.of(context)!.sbhan_allah,AppLocalizations.of(context)!.alhamd_lillahi,AppLocalizations.of(context)!.allah_akbaru,AppLocalizations.of(context)!.tahleel];
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 60,),
        Container(
          decoration: BoxDecoration(color:Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(40),border: Border.all(color: provider.themeMode==ThemeMode.light?AppTheme.lightPrimary:AppTheme.colorGold)),
          child: Center(child: Text("${tasbihList[currentTasbeh]}",
          style:TextStyle(fontSize: 28,fontWeight: FontWeight.w700,color: Colors.white ),
          textAlign: TextAlign.center,
          )),
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.all(24),
        ),
        Text(AppLocalizations.of(context)!.zekr_number,style: Theme.of(context).textTheme.headline1,),
        SizedBox(height: 24,),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(28),border: Border.all(color: provider.themeMode==ThemeMode.light?AppTheme.lightPrimary:AppTheme.colorGold)),
          height: 100,
          width: 80,
          child: Center(child: Text("$counter",style:Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white),)),
          padding: EdgeInsets.all(20),
        ),
        Spacer(flex: 1,),
        ElevatedButton(onPressed: (){clickMeAction();},
         child: Text(AppLocalizations.of(context)!.click_here,style:TextStyle(fontSize: 28,fontWeight: FontWeight.w700,color: Colors.white )),
         style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor,shape: StadiumBorder(side: BorderSide(color: provider.themeMode==ThemeMode.light?AppTheme.lightPrimary:AppTheme.colorGold))),),
          Spacer(flex: 1,),
      ],
    );
  }

  void clickMeAction(){
      counter++;
      if(currentTasbeh!=3){
        if(counter>33){
          counter = 1;
          currentTasbeh++;
        }
      }else{
        if(counter>1){
          counter = 0;
          currentTasbeh = 0;
        }
      }
      setState((){});
    }
}

