import 'package:flutter/material.dart';
import 'package:islamiat/hadeth_tap.dart';
import 'package:islamiat/quraan_tap.dart';
import 'package:islamiat/radio_tap.dart';
import 'package:islamiat/tasbeh_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> content = [QuraanTap(),HadethTap(),TasbehTap(),RadioTap()];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Image.asset("assets/images/main_background.png",width: double.maxFinite,height: double.maxFinite,fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(title: Center(child:Text("اسلاميات",style: Theme.of(context).textTheme.headline1,),),),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index){
                currentIndex = index;
                setState((){});
              },
              items: [
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),label: "Quraan"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),label: "Hadeth"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),label: "Sebha"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),label: "Radio"),
               ],
            ),
          ),
          body: content[currentIndex],
        ),
      ] ,
    );
  }
}
