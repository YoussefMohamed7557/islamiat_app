import 'package:flutter/material.dart';
import 'package:islamiat/app_theme.dart';

class TasbehTap extends StatefulWidget {
  @override
  State<TasbehTap> createState() => _TasbehTapState();
}

class _TasbehTapState extends State<TasbehTap> {
  int counter = 0;

  int currentTasbeh = 0;

  List<String> tasbihList = ["سبحان الله","الحمد لله","الله أكبر","لا اله الا الله وحده لاشريك له الملك و له الحمد و هو على كل شئ قدير"];

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 60,),
        Container(
          decoration: BoxDecoration(color: AppTheme.lightPrimary,borderRadius: BorderRadius.circular(40)),
          child: Center(child: Text("${tasbihList[currentTasbeh]}",
          style:TextStyle(fontSize: 28,fontWeight: FontWeight.w700,color: Colors.white ),
          textAlign: TextAlign.center,
          )),
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.all(24),
        ),
        Text("عدد التسبيحات ",style: Theme.of(context).textTheme.headline1,),
        SizedBox(height: 24,),
        Container(
          decoration: BoxDecoration(color: Color.fromARGB(211, 200, 178, 149),borderRadius: BorderRadius.circular(28)),
          height: 100,
          width: 80,
          child: Center(child: Text("$counter",style:Theme.of(context).textTheme.headline1,)),
          padding: EdgeInsets.all(20),
        ),
        Spacer(flex: 1,),
        ElevatedButton(onPressed: (){clickMeAction();},
         child: Text("اضغط",style:TextStyle(fontSize: 28,fontWeight: FontWeight.w700,color: Colors.white )),
         style: ElevatedButton.styleFrom(backgroundColor: AppTheme.lightPrimary),),
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

