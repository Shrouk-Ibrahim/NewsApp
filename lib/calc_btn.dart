import 'package:flutter/material.dart';

class CalcBtn extends StatelessWidget {
  String num;
  Function onClick;
  CalcBtn({super.key, required this.num,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          onClick(
            num
          );
        },
        child: Text(num,
            style: TextStyle(
              fontSize: 40,
            )),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
