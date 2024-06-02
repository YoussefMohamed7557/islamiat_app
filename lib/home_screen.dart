import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  static const String routName = "HomeScreen";
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
              items: [
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),label: "Quraan"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),label: "Hadeth"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),label: "Sebha"),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),label: "Radio"),
               ],
            ),
          ),
        ),
      ] ,
    );
  }
}
