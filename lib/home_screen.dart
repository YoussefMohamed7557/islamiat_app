import 'package:flutter/material.dart';
import 'package:islamiat/tabs/hadeth/hadeth_tap.dart';
import 'package:islamiat/imagesPath.dart';
import 'package:islamiat/tabs/quraan/quraan_tap.dart';
import 'package:islamiat/tabs/radio_tap.dart';
import 'package:islamiat/tabs/settings/settings_tap.dart';
import 'package:islamiat/tabs/tasbeh_tap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> content = [QuraanTap(),HadethTap(),TasbehTap(),RadioTap(),SettingsTap()];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Image.asset(ImagesPath.MAIN_BACKGROUND,width: double.maxFinite,height: double.maxFinite,fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(title:Center(child:Text(AppLocalizations.of(context)?.islamiat ?? "islamiat",style: Theme.of(context).textTheme.headline1,),),),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor
            ),
            child: BottomNavigationBar(
              iconSize: 32,
              currentIndex: currentIndex,
              onTap: (index){
                currentIndex = index;
                setState((){});
              },
              items: [
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage(ImagesPath.QARAAN_ICON)),label: AppLocalizations.of(context)?.quraan ?? "quraan"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage(ImagesPath.HADETH_ICON)),label: AppLocalizations.of(context)?.hadeth ?? "hadeth"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage(ImagesPath.TASBEH_ICON)),label: AppLocalizations.of(context)?.sebha ?? "sebha"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage(ImagesPath.RADIO_ICON)),label: AppLocalizations.of(context)?.radio ?? "radio"),
                  BottomNavigationBarItem(icon: Icon(Icons.settings),label: AppLocalizations.of(context)?.setting ?? "setting")
               ],
            ),
          ),
          body: content[currentIndex],
        ),
      ] ,
    );
  }
}
