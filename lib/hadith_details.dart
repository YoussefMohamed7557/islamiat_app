import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiat/imagesPath.dart';
import 'package:islamiat/list_items/seprator_item.dart';

import 'app_theme.dart';
import 'list_items/surah_verses_item.dart';

class HadithDetails extends StatefulWidget {
  static const String routeName = "HadithDetails";

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  String hadithItem = "";
  @override
  Widget build(BuildContext context) {
    HadithDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as HadithDetailsArgs;
    if (hadithItem.isEmpty) {
      loadDataFromFile(args.index);
    }
    return Stack(children: [
      Image.asset(
        ImagesPath.MAIN_BACKGROUND,
        width: double.maxFinite,
        height: double.maxFinite,
        fit: BoxFit.fill,
      ),
      Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                const Spacer(
                  flex: 3,
                ),
                Text(
                  "اسلاميات",
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Spacer(
                  flex: 5,
                ),
              ],
            ),
          ),
          body: hadithItem.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              :
              Center(
                child: SingleChildScrollView(
                  child: Container(
                      child: Text(hadithItem,style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,),
                      margin: const EdgeInsets.all(18),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(color:AppTheme.lightPrimary),
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(36, 30, 30, 51)),
                    ),
                ),
              ))
    ]);
  }

  void loadDataFromFile(int index) async {
    String data = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadithList = data.split("#");
    hadithItem = hadithList[index];
    setState(() {});
  }
}

class HadithDetailsArgs {
  int index;
  String hadithName;
  HadithDetailsArgs(this.index, this.hadithName);
}
