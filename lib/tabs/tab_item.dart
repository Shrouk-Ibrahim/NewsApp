import 'package:flutter/material.dart';
import 'package:news/home/model/SourceResponse.dart';
import 'package:news/home/myTheme.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;

  TabItem({required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
          color: isSelected ? MyTheme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: MyTheme.primaryColor,
            width: 3,
          )),
      child: Text(source.name ?? "",
          style: isSelected
              ? Theme.of(context).textTheme.titleLarge
              : Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: MyTheme.primaryColor)),
    );
  }
}
