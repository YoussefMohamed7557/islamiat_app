import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';

class SurahDetails extends StatefulWidget {
  static const String routeName = "SurahDetails";

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  List<String> surahLines = [];

  @override
  Widget build(BuildContext context) {
    SurahDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SurahDetailsArgs;
    if(surahLines.isEmpty){
      loadDataFromFile(args.index);
    }
    return Stack(children: [
      Image.asset(
        "assets/images/main_background.png",
        width: double.maxFinite,
        height: double.maxFinite,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Spacer(
                flex: 3,
              ),
              Text(
                " سورة ${args.surahName}  ",
                style: Theme.of(context).textTheme.headline1,
              ),
              Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
        body: surahLines.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) => Center(
                      child: Text(
                        " ${surahLines[index]} (${index + 1})",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: AppTheme.blackColor,
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      height: 2,
                      color: AppTheme.lightPrimary,
                    ),
                itemCount: surahLines.length),
      )
    ]);
  }

  void loadDataFromFile(int index) async {
    String data = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> versus = data.split("\n");
    surahLines = versus;
    print("$surahLines + ${surahLines.length}");
    setState(() {});
  }
}

class SurahDetailsArgs {
  int index;
  String surahName;
  SurahDetailsArgs(this.index, this.surahName);
}
