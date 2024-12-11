import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Utils/my_color.dart';
import '../../Utils/my_style.dart';
import '../texts/my_text.dart';

class SortSheet extends StatefulWidget {
  const SortSheet({super.key});

  @override
  State<SortSheet> createState() => _SortSheetState();
}

class _SortSheetState extends State<SortSheet> {
  String selectedOption = 'Recent Activity';

  void _updateSelectedOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: MyColor.white1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Center(
              child: Container(
                width: width * 0.3,
                height: height * 0.01,
                decoration: BoxDecoration(
                    color: MyColor.blue1,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: MyColor.black1,
                    size: 32,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                MyText(text: "Sort by", textStyle: MyStyle.black1_25_400),
              ],
            ),
            Divider(),
            buildOption('Recent Activity'),
            buildOption('Title A-Z'),
            buildOption('Author A-Z'),
          ],
        ),
      ),
    );
  }

  Widget buildOption(String option) {
    final bool isSelected = selectedOption == option;
    return Container(
      color: isSelected ? MyColor.grey1 : MyColor.white1,
      child: InkWell(
        onTap: () => _updateSelectedOption(option),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Row(
            children: [
              MyText(text: option, textStyle: MyStyle.grey6_19_400),
              Spacer(),
              Radio(
                focusColor: MyColor.blue1,
                activeColor: MyColor.blue1,
                value: option,
                groupValue: selectedOption,
                onChanged: (value) => _updateSelectedOption(value.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

