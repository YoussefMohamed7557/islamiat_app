import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islamiat/imagesPath.dart';
import 'package:islamiat/list_items/hadith_name_item.dart';
import 'package:islamiat/list_items/seprator_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTap extends StatelessWidget {
  const HadethTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 80,),
        Image.asset(ImagesPath.HADETH_HEADER,height: 200,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              itemCount: 50,
              itemBuilder: (context, index) => HadithNameItem(index, AppLocalizations.of(context)!.hadith_number + "  ${ index+1}"),
            separatorBuilder: (context, index) => SepratorItem(),),
          ),
        ),

      ],
    );
  }
}
