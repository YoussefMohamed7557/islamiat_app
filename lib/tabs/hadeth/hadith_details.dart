import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiat/imagesPath.dart';
import 'package:provider/provider.dart';
import '../../app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/app_provider.dart';

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
    AppProvider provider = Provider.of<AppProvider>(context);
    String selectedBackground = provider.themeMode == ThemeMode.light?ImagesPath.MAIN_BACKGROUND:ImagesPath.MAIN_BACKGROUND_Dark;
    if (hadithItem.isEmpty) {
      loadDataFromFile(args.index);
    }
    return Stack(children: [
      Image.asset(
        selectedBackground,
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
                  AppLocalizations.of(context)!.islamiat,
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
                          border: Border.all(color: provider.themeMode==ThemeMode.light?AppTheme.lightPrimary:AppTheme.colorGold),
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
